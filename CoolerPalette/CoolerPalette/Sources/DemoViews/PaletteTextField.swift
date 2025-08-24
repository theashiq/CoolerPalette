//
//  PaletteTextField.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

public struct PaletteTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    @Environment(\.superPalette) private var palette
    @Environment(\.colorScheme) private var colorScheme
    @FocusState private var isFocused: Bool

    public init(title: String, placeholder: String, text: Binding<String>) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
    }

    private var readableTextColor: Color {
        colorScheme == .dark ? .white : palette.base.primary
    }

    private var readablePlaceholderColor: Color {
        colorScheme == .dark ? Color.white.opacity(0.7) : Color.black.opacity(0.6)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(readableTextColor)

            TextField(placeholder, text: $text)
                .padding(12)
                .foregroundColor(readableTextColor)
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
                .placeholder(when: text.isEmpty) {
                    Text(placeholder)
                        .foregroundColor(readablePlaceholderColor)
                        .padding(.leading, 12)
                }
        }
    }
}

// Extension for placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder _ placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
