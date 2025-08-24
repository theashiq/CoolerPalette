//
//  ContentView.swift
//  CoolerPalette
//
//  Created by Ashiqur Rahman on 25/8/25.
//


import SwiftUI

struct ContentView: View {
    @State private var selectedDemo: DemoType = .basePalette
    @Environment(\.superPalette) private var superPalette

    enum DemoType: String, CaseIterable, Identifiable {
        case basePalette = "Base Palette"
        case gradientPalette = "Gradient Palette"
        case translucentPalette = "Translucent Palette"
        case semanticPalette = "Semantic Palette"
        
        var id: String { rawValue }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Cooler Palette Demos")
                    .font(.title).bold()
                    .foregroundColor(superPalette.semantic.textOnMainBackground)
                
                Picker("Select Demo", selection: $selectedDemo) {
                    ForEach(DemoType.allCases) { demo in
                        Text(demo.rawValue).tag(demo)
                    }
                }
                
                Divider()
                
                // Show the selected demo
                ScrollView {
                    VStack {
                        switch selectedDemo {
                        case .basePalette:
                            BasePaletteDemoView()
                                .environment(\.superPalette, superPalette)
                        case .gradientPalette:
                            GradientPaletteDemoView()
                                .environment(\.superPalette, superPalette)
                        case .translucentPalette:
                            TranslucentPaletteDemoView()
                                .environment(\.superPalette, superPalette)
                        case .semanticPalette:
                            SemanticPaletteDemoView()
                                .environment(\.superPalette, superPalette)
                        }
                    }
                    .padding()
                }
            }
            .background(superPalette.base.background.ignoresSafeArea())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.superPalette, .init(palette: .light))
            .previewDisplayName("Light Mode")
        
        ContentView()
            .environment(\.superPalette, .init(palette: .dark))
            .previewDisplayName("Dark Mode")
    }
}
