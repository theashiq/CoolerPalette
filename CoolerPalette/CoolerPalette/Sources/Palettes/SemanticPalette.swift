//
//  SemanticPalette.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

/// Represents a semantic layer on top of a base Palette, providing text and UI colors
/// that adapt to different background surfaces for readability and consistency.
public class SemanticPalette {
    
    /// The base palette that provides the raw colors for semantic mapping.
    public let base: Palette
    
    /// Text color used on top of elements whose background is the primary color.
    ///
    /// **Use cases:**
    /// - Labels on primary buttons
    /// - Text on highlighted cards or panels using `palette.primary` as background
    /// - Any content that sits directly on top of primary-colored surfaces
    ///
    /// **Not recommended:**
    /// - Using on top of secondary or surface backgrounds
    /// - Large blocks of text on the screen (use `textOnMainBackground` instead)
    public var textOnPrimaryBackground: Color { base.primary.opacity(0.9) }
    
    /// Text color used on top of elements whose background is the secondary color.
    ///
    /// **Use cases:**
    /// - Labels on secondary buttons
    /// - Text on banners or small containers using `palette.secondary` as background
    /// - Badge text or supporting info on secondary surfaces
    ///
    /// **Not recommended:**
    /// - Using on primary-colored or main background areas
    public var textOnSecondaryBackground: Color { base.secondary.opacity(0.9) }
    
    /// Text color used on top of elements whose background is the surface color.
    ///
    /// **Use cases:**
    /// - Card content text
    /// - TextFields labels and content
    /// - Modals or panels using `palette.surface` as background
    ///
    /// **Not recommended:**
    /// - Using on primary, secondary, or main background colors
    public var textOnSurfaceBackground: Color { base.surface.opacity(0.9) }
    
    /// Text color used on top of the main background color.
    ///
    /// **Use cases:**
    /// - Primary body text on screens
    /// - Headings or labels directly on `palette.background`
    /// - Large content areas like dashboards or scrollable sections
    ///
    /// **Not recommended:**
    /// - Using on primary, secondary, or surface backgrounds
    public var textOnMainBackground: Color { base.primary.opacity(0.9) }
    
    /// Text color used on top of highlight-colored backgrounds.
    ///
    /// **Use cases:**
    /// - Text inside focused input fields
    /// - Labels on selected buttons or toggle states
    ///
    /// **Not recommended:**
    /// - Text on main background, primary, or secondary surfaces
    public var textOnHighlightBackground: Color { base.highlight.opacity(0.9) }
    
    /// Color used for disabled or inactive UI elements.
    ///
    /// **Use cases:**
    /// - Disabled buttons or toggles
    /// - Grayed-out icons
    /// - Placeholder text that should appear inactive
    ///
    /// **Not recommended:**
    /// - Use for active or important content
    public var disabled: Color { Color.gray }
    
    /// Color used for dividers or borders that separate content.
    ///
    /// **Use cases:**
    /// - List separators
    /// - Divider lines in forms
    /// - Card outlines or subtle separation between sections
    ///
    /// **Not recommended:**
    /// - Use as main text or background color
    public var divider: Color { Color.gray.opacity(0.5) }
    
    /// Creates a new SemanticPalette using the provided base palette.
    ///
    /// - Parameter palette: The base Palette instance to derive semantic colors from.
    public init(palette: Palette) {
        self.base = palette
    }
}
