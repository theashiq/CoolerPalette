//
//  GradientPaletteDemoView.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

struct GradientPaletteDemoView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    @Environment(\.superPalette) private var palette

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                Text("Gradient Palette Demo")
                    .font(.largeTitle).bold()
                    .foregroundColor(palette.semantic.textOnMainBackground)
                
                // Gradient Buttons
                VStack(spacing: 12) {
                    Button("Primary Gradient Button") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.gradients.primaryGradient)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                    Button("Success Gradient Button") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.gradients.successGradient)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                // TextFields
                VStack(spacing: 12) {
                    GradientTextField(title: "Username",
                                      placeholder: "Enter username",
                                      text: $username)
                    GradientTextField(title: "Email",
                                      placeholder: "Enter email",
                                      text: $email)
                }
                
                // Gradient Cards
                VStack(spacing: 16) {
                    GradientCardView(
                        title: "Primary → Secondary Gradient",
                        description: "This card uses the primary gradient from your palette.",
                        gradient: palette.gradients.primaryGradient
                    )
                    
                    GradientCardView(
                        title: "Success Gradient",
                        description: "This card uses the success gradient.",
                        gradient: palette.gradients.successGradient
                    )
                    
                    GradientCardView(
                        title: "Custom Gradient",
                        description: "You can also create custom gradients on the fly.",
                        gradient: palette.gradients.gradient(
                            from: palette.base.warning,
                            to: palette.base.error,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    
                    // Image Card
                    ImageGradientCardView(
                        title: "Image Card",
                        description: "This card has an image background with a gradient overlay to make text readable.",
                        systemImage: "photo",
                        gradient: palette.gradients.primaryGradient
                    )
                }
            }
            .padding()
        }
        .background(
            palette.gradients.primaryGradient.rotationEffect(.degrees(180))
                .ignoresSafeArea() // <-- gradient background ignoring all edges
        )
    }
}

// MARK: - ImageGradientCardView
struct ImageGradientCardView: View {
    let title: String
    let description: String
    let systemImage: String
    let gradient: LinearGradient

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            GeometryReader { geo in
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit() // scale image to fit height
                    .frame(width: geo.size.width) // full width
                    .padding()
                    .clipped()
                    .overlay(gradient.opacity(0.6))
                    .cornerRadius(12)
            }
            .frame(height: 180) // fixed card height

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding()
        }
        .frame(maxWidth: .infinity) // make card full width
    }
}



// MARK: - Gradient TextField
struct GradientTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    @Environment(\.superPalette) private var palette
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(palette.semantic.textOnMainBackground)
            
            TextField(placeholder, text: $text)
                .padding(12)
                .foregroundColor(palette.base.primary) // readable on surface
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(palette.base.surface)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isFocused ? palette.base.highlight : palette.semantic.divider,
                                lineWidth: isFocused ? 2 : 1)
                )
                .focused($isFocused)
        }
    }
}


// MARK: - GradientCardView
struct GradientCardView: View {
    let title: String
    let description: String
    let gradient: LinearGradient

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.9))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(gradient)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

// MARK: - Preview
struct GradientPaletteDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GradientPaletteDemoView()
            .environment(\.superPalette, .init(palette: .light))
            .previewDisplayName("Light Mode")

        GradientPaletteDemoView()
            .environment(\.superPalette, .init(palette: .dark))
            .previewDisplayName("Dark Mode")
    }
}
