//
//  SignalGenerator.swift
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

import SwiftUI
import Combine

struct SignalGenerator: View {
    @StateObject private var rfSignalGeneratorWrapper = RFSignalGeneratorWrapperSwift()

    @State private var showAlert = false
    @State private var chartData: [Double] = []
    @State private var chartUpdateCancellable: AnyCancellable?

    var body: some View {
        VStack {
            HStack {
                Text("Frequency (MHz):")
                TextField("Frequency", value: $rfSignalGeneratorWrapper.frequency, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150)
                    .padding(.leading, 4)
                    .onChange(of: rfSignalGeneratorWrapper.frequency) { _ in
                        chartUpdateCancellable?.cancel()

                        let frequency = rfSignalGeneratorWrapper.frequency
                        let updateInterval = 1.0 / (frequency * 0.01) // 1% of the frequency period

                        chartUpdateCancellable = Timer.publish(every: updateInterval, on: .main, in: .common)
                            .autoconnect()
                            .sink { _ in
                                let randomValue = Double.random(in: -1.0...1.0)
                                chartData.append(randomValue)
                                if chartData.count > 100 {
                                    chartData.removeFirst()
                                }
                            }
                    }
            }
                
            HStack {
                Text("Power Level (dBm):")
                TextField("Power Level", value: $rfSignalGeneratorWrapper.powerLevel, format: .number)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150)
                    .padding(.leading, 4)
            }

            Toggle(isOn: $rfSignalGeneratorWrapper.outputEnabled) {
                Text("Output Enabled")
            }

            Button(action: {
                showAlert = true
            }) {
                Text("Show RF Signal Generator Status")
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("RF Signal Generator Status"),
                    message: Text(rfSignalGeneratorWrapper.getStatus()),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            LineChartView(data: $chartData)
                            .frame(height: 300)
                            .padding(.top)

                        Spacer()
        }
    }
}
