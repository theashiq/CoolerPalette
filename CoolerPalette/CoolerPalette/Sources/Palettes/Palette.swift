//
//  Palette.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//

import SwiftUI

/// Represents a basic color palette for the app, providing primary, secondary, background, and semantic colors.
/// Use this palette as the foundation for theming your app consistently.
public class Palette {
    
    /// The main accent color used for primary actions, highlights, or important elements.
    ///
    /// **Use cases:**
    /// - Primary buttons (`Button.background`)
    /// - Important icons or highlights
    /// - Active states or selected tabs
    ///
    /// **Not recommended:**
    /// - Use as a large screen background
    /// - Use for card or panel surfaces (use `surface` instead)
    public var primary: Color
    
    /// A secondary accent color used to complement the primary color, typically for supporting UI elements.
    ///
    /// **Use cases:**
    /// - Secondary buttons (`Button.background`)
    /// - Highlighting less important elements
    /// - Badges or labels that support primary content
    ///
    /// **Not recommended:**
    /// - Use as the main background of the app
    /// - Use for large cards or surfaces
    public var secondary: Color
    
    /// The main background color of the app, typically used for screens and large canvas areas.
    ///
    /// **Use cases:**
    /// - Main app window or screen background
    /// - General content canvas
    /// - Sections that need a neutral backdrop for cards and text
    ///
    /// **Not recommended:**
    /// - Use as primary/secondary buttons or highlights
    /// - Use as card or panel surfaces (use `surface` instead)
    public var background: Color
    
    /// The color used for content containers such as cards, panels, modals, and other surfaces that sit on top of the background.
    ///
    /// **Use cases:**
    /// - Card backgrounds
    /// - TextFields or input fields
    /// - Sheets, popovers, or floating panels
    /// - Small sections that need separation from the main background
    ///
    /// **Not recommended:**
    /// - Use as primary or secondary accent color
    /// - Use as main screen background
    public var surface: Color
    
    /// A color used for highlighting interactive or focused elements, such as inputs, buttons, or selected items.
    ///
    /// **Use cases:**
    /// - TextField / input focus border
    /// - Selected button or toggle states
    /// - Table row selection, slider handles, or active indicators
    ///
    /// **Not recommended:**
    /// - Using as a main background or surface color
    /// - Using for large content blocks
    public var highlight: Color
    
    /// The color representing success states, such as confirmation messages or success indicators.
    ///
    /// **Use cases:**
    /// - Success banners or alerts
    /// - Checkmarks or completion indicators
    /// - Form validation feedback
    ///
    /// **Not recommended:**
    /// - Use for buttons, backgrounds, or text that aren’t status indicators
    public var success: Color
    
    /// The color representing warning states, such as alerts or cautionary messages.
    ///
    /// **Use cases:**
    /// - Warning banners or alerts
    /// - Minor caution icons
    /// - Callouts for important but non-critical information
    ///
    /// **Not recommended:**
    /// - Use for general content text, card backgrounds, or primary buttons
    public var warning: Color
    
    /// The color representing error states, such as failures or invalid inputs.
    ///
    /// **Use cases:**
    /// - Error banners or alerts
    /// - Form field validation errors
    /// - Error icons or text
    ///
    /// **Not recommended:**
    /// - Use as background or general-purpose button color
    public var error: Color
    
    /// Creates a new Palette instance with the specified colors.
    ///
    /// - Parameters:
    ///   - primary: The main accent color (e.g., primary button background or active highlights).
    ///   - secondary: The secondary accent color (e.g., secondary buttons or badges).
    ///   - background: The main background color for screens or general content areas.
    ///   - surface: The background color for cards, panels, inputs, or floating surfaces.
    ///   - success: Color for success states (e.g., checkmarks, success banners).
    ///   - warning: Color for warning states (e.g., caution messages or alerts).
    ///   - error: Color for error states (e.g., invalid inputs or error notifications).
    public init(
        primary: Color,
        secondary: Color,
        background: Color,
        surface: Color,
        success: Color,
        warning: Color,
        error: Color,
        highlight: Color
    ) {
        self.primary = primary
        self.secondary = secondary
        self.background = background
        self.surface = surface
        self.success = success
        self.warning = warning
        self.error = error
        self.highlight = highlight
    }
}

public extension Palette {
    /// Example light theme palette.
    /// Lazily initialized and only created when first accessed.
    static let light: Palette = {
        Palette(
            primary: Color(hex: "#3B82F6"),
            secondary: Color(hex: "#9333EA"),
            background: Color(hex: "#F9FAFB"),
            surface: .white,
            success: Color(hex: "#10B981"),
            warning: Color(hex: "#F59E0B"),
            error: Color(hex: "#EF4444"),
            highlight: Color(hex: "#3B82F6").opacity(0.5)
        )
    }()
    
    /// Example dark theme palette.
    /// Lazily initialized and only created when first accessed.
    static let dark: Palette = {
        Palette(
            primary: Color(hex: "#60A5FA"),
            secondary: Color(hex: "#A855F7"),
            background: Color(hex: "#111827"),
            surface: Color(hex: "#1F2937"),
            success: Color(hex: "#34D399"),
            warning: Color(hex: "#FBBF24"),
            error: Color(hex: "#F87171"),
            highlight: Color(hex: "#60A5FA").opacity(0.5)
        )
    }()
}

