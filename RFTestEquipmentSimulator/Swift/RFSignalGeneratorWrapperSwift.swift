//
//  RFSignalGeneratorWrapperSwift.swift
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

import Foundation
import Combine

class RFSignalGeneratorWrapperSwift: ObservableObject {
    private let rfSignalGeneratorWrapper = RFSignalGeneratorWrapper()

    @Published var frequency: Double {
        didSet {
            rfSignalGeneratorWrapper.setFrequency(frequency)
        }
    }
    @Published var powerLevel: Double {
        didSet {
            rfSignalGeneratorWrapper.setPowerLevel(powerLevel)
        }
    }
    @Published var outputEnabled: Bool {
        didSet {
            rfSignalGeneratorWrapper.setOutputEnabled(outputEnabled)
        }
    }

    init() {
        frequency = rfSignalGeneratorWrapper.getFrequency()
        powerLevel = rfSignalGeneratorWrapper.getPowerLevel()
        outputEnabled = rfSignalGeneratorWrapper.getOutputEnabled()
    }

    func getStatus() -> String {
        return rfSignalGeneratorWrapper.getStatus()
    }
}
