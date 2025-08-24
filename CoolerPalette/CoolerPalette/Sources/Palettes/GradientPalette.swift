//
//  GradientPalette.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//

import SwiftUI

/// Represents a palette of gradients derived from a base Palette.
/// Provides ready-to-use gradient styles for UI elements and custom gradient creation.
public class GradientPalette {
    
    /// The base palette used to derive gradient colors.
    public let base: Palette
    
    /// A gradient transitioning from the primary color to the secondary color.
    ///
    /// **Use cases:**
    /// - Background for primary buttons or call-to-action elements
    /// - Banner backgrounds or highlighted sections
    /// - Accent overlays on cards or panels
    ///
    /// **Not recommended:**
    /// - Using as a full-screen background for all content (may overpower the UI)
    /// - Using in small text elements (contrast may be insufficient)
    public var primaryGradient: LinearGradient {
        LinearGradient(
            colors: [base.primary, base.secondary],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    /// A gradient emphasizing the success color, fading from semi-transparent to full.
    ///
    /// **Use cases:**
    /// - Success banners or confirmation messages
    /// - Highlighting success indicators or progress bars
    ///
    /// **Not recommended:**
    /// - Using for general-purpose backgrounds or critical alerts
    public var successGradient: LinearGradient {
        LinearGradient(
            colors: [base.success.opacity(0.7), base.success],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    /// A gradient for highlighting interactive or selected elements.
    ///
    /// **Use cases:**
    /// - Hover states, active buttons
    /// - Highlighted cards or banners
    ///
    /// **Not recommended:**
    /// - Using gradients for text or small elements where readability is critical
    public var highlightGradient: LinearGradient {
        LinearGradient(
            colors: [base.highlight.opacity(0.7), base.highlight],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    /// Creates a custom gradient from two colors with optional start and end points.
    ///
    /// **Use cases:**
    /// - Any component that requires a unique gradient not provided by default
    /// - Overlays, cards, buttons, or decorative UI elements
    ///
    /// **Parameters:**
    /// - `color1`: Starting color of the gradient
    /// - `color2`: Ending color of the gradient
    /// - `startPoint`: Gradient start point (default: `.top`)
    /// - `endPoint`: Gradient end point (default: `.bottom`)
    ///
    /// **Not recommended:**
    /// - Using gradients that reduce readability of overlaid text
    public func gradient(
        from color1: Color,
        to color2: Color,
        startPoint: UnitPoint = .top,
        endPoint: UnitPoint = .bottom
    ) -> LinearGradient {
        LinearGradient(
            colors: [color1, color2],
            startPoint: startPoint,
            endPoint: endPoint
        )
    }
    
    /// Initializes a GradientPalette using a base Palette.
    ///
    /// - Parameter palette: The base Palette to derive gradient colors from.
    public init(palette: Palette) {
        self.base = palette
    }
}

