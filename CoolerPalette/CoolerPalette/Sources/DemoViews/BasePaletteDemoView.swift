//
//  BasePaletteDemoView.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

struct BasePaletteDemoView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    @Environment(\.superPalette) private var palette

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Header Title
                Text("Base Palette Demo")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(palette.base.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Buttons
                VStack(spacing: 12) {
                    Button("Primary Button") {}
                        .buttonStyle(FilledButtonStyle(bg: palette.base.primary))
                    Button("Secondary Button") {}
                        .buttonStyle(FilledButtonStyle(bg: palette.base.secondary))
                    Button("Highlight Button") {}
                        .buttonStyle(FilledButtonStyle(bg: palette.base.highlight))
                }
                
                // TextFields
                VStack(spacing: 12) {
                    PaletteTextField(title: "Username", placeholder: "Enter username", text: $username)
                    PaletteTextField(title: "Email", placeholder: "Enter email", text: $email)
                }
                
                // MARK: - Cards
                VStack(spacing: 16) {
                    CardView(
                        title: "Surface Card",
                        description: "This card uses the surface color. Great for elevated components like info panels or pop-ups.",
                        color: palette.base.surface,
                        textColor: palette.base.primary
                    )
                    
                    CardView(title: "Highlight Card",
                             description: "Use highlight color for selected states, buttons, or important notices.",
                             color: palette.base.highlight,
                             textColor: .white)
                    
                    CardView(title: "Long Text Card",
                             description: """
                             This card demonstrates handling of long text content. The text should wrap correctly and maintain readability across light and dark themes.
                             You can use this for news feeds, notifications, or article previews.
                             """,
                             color: palette.base.surface,
                             textColor: palette.base.primary)
                    
                    ImageCardView(title: "Image Card",
                                  description: "Illustrative card with an SF Symbol image in the background.",
                                  color: palette.base.surface,
                                  textColor: palette.base.primary,
                                  systemImage: "photo")
                    
                    GradientCardView(title: "Gradient Card",
                                     description: "Primary → Secondary gradient background.",
                                     gradient: palette.gradients.primaryGradient)
                }
            }
            .padding()
        }
        .background(
            palette.base.background
                .ignoresSafeArea()
        )
    }
}



// MARK: - Reusable Card Components
struct CardView: View {
    let title: String
    let description: String
    let color: Color
    let textColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(color)
                .shadow(radius: 4)
            
            // Optional overlay for better contrast
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(color.isLight ? 0.05 : 0.25)) // subtle dim overlay
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(textColor)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(textColor.opacity(0.9))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// MARK: - Color brightness helper
extension Color {
    var isLight: Bool {
        // Simple heuristic using RGB components
        let uiColor = UIColor(self)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        // Standard perceived brightness formula
        let brightness = (0.299*r + 0.587*g + 0.114*b)
        return brightness > 0.7
    }
}


struct ImageCardView: View {
    let title: String
    let description: String
    let color: Color
    let textColor: Color
    let systemImage: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(color)
                .frame(height: 160)
                .shadow(radius: 4)
                .overlay(
                    Image(systemName: systemImage)
                        .resizable()
                        .scaledToFit()
                        .opacity(0.15)
                        .padding(28)
                        .foregroundColor(.gray)
                )
            
            // Semi-transparent overlay for better text readability
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.25))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(.headline)
                Text(description).font(.subheadline).opacity(0.9)
            }
            .padding()
            .foregroundColor(.white) // White text is more readable on overlay
        }
    }
}

// MARK: - Reusable Button Styles
struct FilledButtonStyle: ButtonStyle {
    let bg: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(bg)
            .foregroundColor(.white)
            .cornerRadius(12)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .shadow(radius: configuration.isPressed ? 0 : 4)
    }
}

// MARK: - Preview
struct BasePaletteDemoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BasePaletteDemoView()
                .environment(\.superPalette, .init(palette: .light))
                .previewDisplayName("Light Mode")
            
            BasePaletteDemoView()
                .environment(\.superPalette, .init(palette: .dark))
                .previewDisplayName("Dark Mode")
        }
    }
}
