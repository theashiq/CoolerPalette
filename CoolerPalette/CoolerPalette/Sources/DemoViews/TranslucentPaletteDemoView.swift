//
//  TranslucentPaletteDemoView.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

struct TranslucentPaletteDemoView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    @Environment(\.superPalette) private var palette

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                Text("Translucent Palette Demo")
                    .font(.largeTitle).bold()
                    .foregroundColor(palette.semantic.textOnMainBackground)
                
                // Translucent Buttons
                VStack(spacing: 12) {
                    Button("Primary Translucent Button") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.translucent.primary)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                    Button("Secondary Translucent Button") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.translucent.secondary)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                    Button("Highlight Translucent Button") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.translucent.highlight)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                // Translucent TextFields
                VStack(spacing: 12) {
                    TranslucentTextField(title: "Username",
                                         placeholder: "Enter username",
                                         text: $username)
                    TranslucentTextField(title: "Email",
                                         placeholder: "Enter email",
                                         text: $email)
                }
                
                // Translucent Cards
                VStack(spacing: 16) {
                    TranslucentCardView(
                        title: "Primary Card",
                        description: "This card uses translucent primary color.",
                        color: palette.translucent.primary
                    )
                    
                    TranslucentCardView(
                        title: "Secondary Card",
                        description: "This card uses translucent secondary color.",
                        color: palette.translucent.secondary
                    )
                    
                    TranslucentCardView(
                        title: "Surface Card",
                        description: "This card uses translucent surface color.",
                        color: palette.translucent.surface
                    )
                    
                    TranslucentCardView(
                        title: "Background Card",
                        description: "This card uses translucent background color.",
                        color: palette.translucent.background
                    )
                }
            }
            .padding()
        }
        .background(
            palette.gradients.primaryGradient.rotationEffect(.degrees(180))
                .ignoresSafeArea()
        )
    }
}


// MARK: - Translucent Card
struct TranslucentCardView: View {
    let title: String
    let description: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.9))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

// MARK: - Translucent TextField
struct TranslucentTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    @Environment(\.superPalette) private var palette
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            TextField(placeholder, text: $text)
                .padding(12)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(palette.translucent.surface)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isFocused ? palette.translucent.highlight : Color.white.opacity(0.5),
                                lineWidth: isFocused ? 2 : 1)
                )
                .focused($isFocused)
        }
    }
}

// MARK: - Preview
struct TranslucentPaletteDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TranslucentPaletteDemoView()
            .environment(\.superPalette, .init(palette: .light))
            .previewDisplayName("Light Mode")

        TranslucentPaletteDemoView()
            .environment(\.superPalette, .init(palette: .dark))
            .previewDisplayName("Dark Mode")
    }
}
