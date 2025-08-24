//
//  TranslucentPalette.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

import SwiftUI

/// A palette that provides translucent versions of the base Palette colors.
/// Useful for semi-transparent overlays, glass-like panels, or frosted UI effects.
public class TranslucentPalette {
    
    /// The base palette containing primary, secondary, background, and surface colors.
    ///
    /// **Use cases:**
    /// - Provides raw colors to derive translucent versions
    ///
    /// **Not recommended:**
    /// - Using the base palette directly without considering translucency effects
    public let base: Palette
    
    /// The alpha value applied to each color to create translucency.
    ///
    /// **Use cases:**
    /// - Adjusting the transparency of UI elements consistently
    ///
    /// **Not recommended:**
    /// - Setting alpha too high (close to 1.0) for elements meant to appear semi-transparent
    public let alpha: Double
    
    /// Translucent version of the primary color.
    ///
    /// **Use cases:**
    /// - Semi-transparent overlays on primary-colored elements
    /// - Highlight effects on cards or buttons
    ///
    /// **Not recommended:**
    /// - Using as a fully opaque primary color replacement
    public var primary: Color { base.primary.opacity(alpha) }
    
    /// Translucent version of the secondary color.
    ///
    /// **Use cases:**
    /// - Semi-transparent overlays on secondary-colored elements
    /// - Badges or supporting UI components with transparency
    ///
    /// **Not recommended:**
    /// - Using as a fully opaque secondary color replacement
    public var secondary: Color { base.secondary.opacity(alpha) }
    
    /// Translucent version of the background color.
    ///
    /// **Use cases:**
    /// - Overlay backgrounds on screens or panels
    /// - Frosted sections where some underlying content should show through
    ///
    /// **Not recommended:**
    /// - Using as a main opaque background
    public var background: Color { base.background.opacity(alpha) }
    
    /// Translucent version of the surface color.
    ///
    /// **Use cases:**
    /// - Semi-transparent cards or modals
    /// - Floating panels or containers
    ///
    /// **Not recommended:**
    /// - Using as a fully opaque surface color
    public var surface: Color { base.surface.opacity(alpha) }
    
    /// Translucent version of the highlight color.
    ///
    /// **Use cases:**
    /// - Focused or selected buttons
    /// - Active text fields
    /// - Indicating interactive states on cards or panels
    ///
    /// **Not recommended:**
    /// - Using as a background for non-interactive components
    /// - Replacing primary or secondary colors for general content
    public var highlight: Color { base.highlight.opacity(alpha) }
    
    /// Initializes a TranslucentPalette with a base palette and alpha value.
    ///
    /// - Parameters:
    ///   - palette: The base Palette to derive translucent colors from.
    ///   - alpha: The opacity to apply to each color (default is 0.7).
    public init(palette: Palette, alpha: Double = 0.7) {
        self.base = palette
        self.alpha = alpha
    }
}
