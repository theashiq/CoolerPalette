//
//  DynamicPaletteModifier.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

struct DynamicPaletteModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    
    let light: SuperPalette
    let dark: SuperPalette
    
    func body(content: Content) -> some View {
        let currentPalette = colorScheme == .dark ? dark : light
        return content.environment(\.superPalette, currentPalette)
    }
}

public extension View {
    func dynamicPalette(light: SuperPalette, dark: SuperPalette) -> some View {
        modifier(DynamicPaletteModifier(light: light, dark: dark))
    }
}
