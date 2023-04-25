//
//  rf_signal_generator.cpp
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

#include "rf_signal_generator.hpp"
#include <sstream>

RFSignalGenerator::RFSignalGenerator() : frequency(1000.0), powerLevel(0.0), outputEnabled(false) {}

double RFSignalGenerator::getFrequency() const {
    return frequency;
}

void RFSignalGenerator::setFrequency(double frequency) {
    this->frequency = frequency;
}

double RFSignalGenerator::getPowerLevel() const {
    return powerLevel;
}

void RFSignalGenerator::setPowerLevel(double powerLevel) {
    this->powerLevel = powerLevel;
}

bool RFSignalGenerator::getOutputEnabled() const {
    return outputEnabled;
}

void RFSignalGenerator::setOutputEnabled(bool outputEnabled) {
    this->outputEnabled = outputEnabled;
}

std::string RFSignalGenerator::getStatus() const {
    std::stringstream status;
    status << "Frequency: " << frequency << " Hz" << std::endl
           << "Power Level: " << powerLevel << " dBm" << std::endl
           << "Output: " << (outputEnabled ? "Enabled" : "Disabled");

    return status.str();
}
