//
//  SignalGenerator.swift
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

import SwiftUI

struct SignalGenerator: View {
    @State private var frequency: String = "1000"
    @State private var powerLevel: String = "0"
    @State private var outputEnabled: Bool = false

    private var rfSignalGeneratorWrapper = RFSignalGeneratorWrapper()

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Frequency (Hz)")
                    .font(.headline)

                TextField("Enter frequency", text: $frequency, onCommit: {
                    if let frequencyValue = Double(frequency) {
                        rfSignalGeneratorWrapper.setFrequency(frequencyValue)
                    }
                })
                .padding()
                .cornerRadius(8)

                Text("Power Level (dBm)")
                    .font(.headline)

                TextField("Enter power level", text: $powerLevel, onCommit: {
                    if let powerLevelValue = Double(powerLevel) {
                        rfSignalGeneratorWrapper.setPowerLevel(powerLevelValue)
                    }
                })
                .padding()
                .cornerRadius(8)

                Toggle("Output Enabled", isOn: $outputEnabled)
                    .onChange(of: outputEnabled, perform: { value in
                        rfSignalGeneratorWrapper.setOutputEnabled(value)
                    })
                    .padding(.vertical)
            }
            .padding()

            Divider()

            VStack {
                Text("RF Signal Generator Status")
                    .font(.headline)
                Text(rfSignalGeneratorWrapper.getStatus())
                    .padding()
            }
        }
    }
}
