//
//  PaletteKeys.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

// MARK: - Base Palette Environment Key
public struct PaletteKey: EnvironmentKey {
    public static let defaultValue: Palette = Palette.light
}

public extension EnvironmentValues {
    var palette: Palette {
        get { self[PaletteKey.self] }
        set { self[PaletteKey.self] = newValue }
    }
}

// MARK: - SemanticPalette Environment Key
public struct SemanticPaletteKey: EnvironmentKey {
    public static let defaultValue: SemanticPalette = SemanticPalette(palette: Palette.light)
}

public extension EnvironmentValues {
    var semanticPalette: SemanticPalette {
        get { self[SemanticPaletteKey.self] }
        set { self[SemanticPaletteKey.self] = newValue }
    }
}

// MARK: - TranslucentPalette Environment Key
public struct TranslucentPaletteKey: EnvironmentKey {
    public static let defaultValue: TranslucentPalette = TranslucentPalette(palette: Palette.light)
}

public extension EnvironmentValues {
    var translucentPalette: TranslucentPalette {
        get { self[TranslucentPaletteKey.self] }
        set { self[TranslucentPaletteKey.self] = newValue }
    }
}

// MARK: - GradientPalette Environment Key
public struct GradientPaletteKey: EnvironmentKey {
    public static let defaultValue: GradientPalette = GradientPalette(palette: Palette.light)
}

public extension EnvironmentValues {
    var gradientPalette: GradientPalette {
        get { self[GradientPaletteKey.self] }
        set { self[GradientPaletteKey.self] = newValue }
    }
}


// MARK: - SuperPaletteKey Environment Key
public struct SuperPaletteKey: EnvironmentKey {
    public static let defaultValue: SuperPalette = SuperPalette(palette: Palette.light)
}

public extension EnvironmentValues {
    var superPalette: SuperPalette {
        get { self[SuperPaletteKey.self] }
        set { self[SuperPaletteKey.self] = newValue }
    }
}


// MARK: - Convenience View Modifiers
extension View {
    public func palette(_ palette: Palette) -> some View {
        environment(\.palette, palette)
    }
    
    public func semanticPalette(_ palette: SemanticPalette) -> some View {
        environment(\.semanticPalette, palette)
    }
    
    public func translucentPalette(_ palette: TranslucentPalette) -> some View {
        environment(\.translucentPalette, palette)
    }
    
    public func gradientPalette(_ palette: GradientPalette) -> some View {
        environment(\.gradientPalette, palette)
    }
    
    public func superPalette(_ palette: SuperPalette) -> some View {
        environment(\.superPalette, palette)
    }
}

