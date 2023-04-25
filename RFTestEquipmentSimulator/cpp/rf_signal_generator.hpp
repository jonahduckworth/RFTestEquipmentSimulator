//
//  rf_signal_generator.hpp
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

#ifndef rf_signal_generator_hpp
#define rf_signal_generator_hpp

#include <string>

class RFSignalGenerator {
public:
    RFSignalGenerator();

    double getFrequency() const;
    void setFrequency(double frequency);

    double getPowerLevel() const;
    void setPowerLevel(double powerLevel);

    bool getOutputEnabled() const;
    void setOutputEnabled(bool outputEnabled);

    std::string getStatus() const;

private:
    double frequency;
    double powerLevel;
    bool outputEnabled;
};

#endif /* rf_signal_generator_hpp */
