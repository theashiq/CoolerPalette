//
//  SuperPalette.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

/// A comprehensive palette that combines base colors, semantic colors, gradients,
/// and translucency into a single object for consistent theming across the app.
public class SuperPalette {
    
    /// The base palette containing primary, secondary, background, surface, and semantic colors.
    ///
    /// **Use cases:**
    /// - Provides the raw colors for all semantic, gradient, and translucent palettes
    ///
    /// **Not recommended:**
    /// - Use directly for UI elements without considering semantic usage
    public let base: Palette
    
    /// The alpha value used for translucency effects in TranslucentPalette.
    ///
    /// **Use cases:**
    /// - Adjusting the opacity of translucent elements globally
    ///
    /// **Not recommended:**
    /// - Setting alpha too high (close to 1.0) for elements meant to appear semi-transparent
    public let alpha: Double
    
    /// Semantic colors derived from the base palette for text, disabled states, and dividers.
    ///
    /// **Use cases:**
    /// - Determining text color on primary, secondary, surface, and main backgrounds
    /// - Providing colors for disabled UI elements and dividers
    ///
    /// **Not recommended:**
    /// - Using semantic colors for raw backgrounds or buttons without considering context
    public let semantic: SemanticPalette
    
    /// Translucent versions of palette colors with the specified alpha.
    ///
    /// **Use cases:**
    /// - Semi-transparent overlays
    /// - Glass-like panels
    /// - Frosted UI effects
    ///
    /// **Not recommended:**
    /// - Using fully opaque translucent colors for main content
    public let translucent: TranslucentPalette
    
    /// Gradients derived from the base palette for UI elements.
    ///
    /// **Use cases:**
    /// - Gradient backgrounds for buttons, banners, cards, or sections
    /// - Highlighting status indicators like success or warning
    ///
    /// **Not recommended:**
    /// - Using gradients for text or small elements where readability is critical
    public let gradients: GradientPalette
    
    /// Initializes a SuperPalette combining base colors, semantic mapping, translucency, and gradients.
    ///
    /// - Parameters:
    ///   - palette: The base Palette to derive semantic, gradient, and translucent colors from.
    ///   - alpha: The opacity value for translucent colors (default is 0.7).
    public init(palette: Palette, alpha: Double = 0.7) {
        self.base = palette
        self.alpha = alpha
        self.semantic = SemanticPalette(palette: palette)
        self.translucent = TranslucentPalette(palette: palette, alpha: alpha)
        self.gradients = GradientPalette(palette: palette)
    }
}
