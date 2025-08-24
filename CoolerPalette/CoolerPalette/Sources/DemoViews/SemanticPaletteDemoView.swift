//
//  SemanticPaletteDemoView.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

struct SemanticPaletteDemoView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    @Environment(\.superPalette) private var palette

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Header
                Text("Semantic Palette Demo")
                    .font(.largeTitle).bold()
                    .foregroundColor(palette.semantic.textOnMainBackground)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Buttons using semantic colors for text
                VStack(spacing: 12) {
                    Button("Primary Text on Primary Background") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.base.primary)
                        .foregroundColor(palette.semantic.textOnPrimaryBackground)
                        .cornerRadius(12)
                    
                    Button("Secondary Text on Secondary Background") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.base.secondary)
                        .foregroundColor(palette.semantic.textOnSecondaryBackground)
                        .cornerRadius(12)
                    
                    Button("Text on Surface Background") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.base.surface)
                        .foregroundColor(palette.semantic.textOnSurfaceBackground)
                        .cornerRadius(12)
                    
                    Button("Text on Main Background") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.base.background)
                        .foregroundColor(palette.semantic.textOnMainBackground)
                        .cornerRadius(12)
                    
                    Button("Disabled Button") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(palette.base.surface)
                        .foregroundColor(palette.semantic.disabled)
                        .cornerRadius(12)
                }
                
                // TextFields using semantic colors
                VStack(spacing: 12) {
                    SemanticTextField(title: "Username",
                                      placeholder: "Enter username",
                                      text: $username)
                    SemanticTextField(title: "Email",
                                      placeholder: "Enter email",
                                      text: $email)
                }
                
                // MARK: - Cards showing semantic text colors
                VStack(spacing: 16) {
                    CardView(
                        title: "Primary Background Card",
                        description: "Text uses semantic.textOnPrimaryBackground",
                        color: palette.base.primary,
                        textColor: palette.semantic.textOnPrimaryBackground
                    )
                    
                    CardView(
                        title: "Secondary Background Card",
                        description: "Text uses semantic.textOnSecondaryBackground",
                        color: palette.base.secondary,
                        textColor: palette.semantic.textOnSecondaryBackground
                    )
                    
                    CardView(
                        title: "Surface Background Card",
                        description: "Text uses semantic.textOnSurfaceBackground",
                        color: palette.base.surface,
                        textColor: palette.semantic.textOnSurfaceBackground
                    )
                    
                    CardView(
                        title: "Main Background Card",
                        description: "Text uses semantic.textOnMainBackground",
                        color: palette.base.background,
                        textColor: palette.semantic.textOnMainBackground
                    )
                    
                    CardView(
                        title: "Divider / Disabled Text Example",
                        description: "Divider and disabled text are demonstrated below",
                        color: palette.base.surface,
                        textColor: palette.semantic.divider
                    )
                }
            }
            .padding()
        }
        .background(palette.base.background.ignoresSafeArea())
    }
}

// MARK: - Semantic TextField
struct SemanticTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    @Environment(\.superPalette) private var palette
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(palette.semantic.textOnPrimaryBackground)
            
            TextField(placeholder, text: $text)
                .padding(12)
                .foregroundColor(palette.semantic.textOnSurfaceBackground)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(palette.base.surface)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isFocused ? palette.semantic.textOnPrimaryBackground : palette.semantic.divider, lineWidth: isFocused ? 2 : 1)
                )
                .focused($isFocused)
        }
    }
}

// MARK: - Preview
struct SemanticPaletteDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SemanticPaletteDemoView()
            .environment(\.superPalette, .init(palette: .light))
            .previewDisplayName("Light Mode")
        
        SemanticPaletteDemoView()
            .environment(\.superPalette, .init(palette: .dark))
            .previewDisplayName("Dark Mode")
    }
}
