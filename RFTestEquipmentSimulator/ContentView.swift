//
//  ContentView.swift
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SignalGenerator()
                .tabItem {
                    Label("Signal Generator", systemImage: "waveform.path.ecg")
                }
            
            SpectrumAnalyzerView()
                .tabItem {
                    Label("Spectrum Analyzer", systemImage: "waveform.path")
                }
            
            NetworkAnalyzerView()
                .tabItem {
                    Label("Network Analyzer", systemImage: "network")
                }
        }
    }
}

struct SpectrumAnalyzerView: View {
    var body: some View {
        Text("Spectrum Analyzer")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NetworkAnalyzerView: View {
    var body: some View {
        Text("Network Analyzer")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
