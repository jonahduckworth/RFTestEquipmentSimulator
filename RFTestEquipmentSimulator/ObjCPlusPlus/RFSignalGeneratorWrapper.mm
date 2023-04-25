//
//  RFSignalGeneratorWrapper.m
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

#import "RFSignalGeneratorWrapper.h"
#import "../cpp/rf_signal_generator.hpp"

@interface RFSignalGeneratorWrapper ()

@property (nonatomic, assign) std::shared_ptr<RFSignalGenerator> rfSignalGenerator;

@end

@implementation RFSignalGeneratorWrapper

- (instancetype)init {
    self = [super init];
    if (self) {
        _rfSignalGenerator = std::make_shared<RFSignalGenerator>();
    }
    return self;
}

- (void)setFrequency:(double)frequency {
    _rfSignalGenerator->setFrequency(frequency);
}

- (double)getFrequency {
    return _rfSignalGenerator->getFrequency();
}

- (void)setPowerLevel:(double)powerLevel {
    _rfSignalGenerator->setPowerLevel(powerLevel);
}

- (double)getPowerLevel {
    return _rfSignalGenerator->getPowerLevel();
}

- (void)setOutputEnabled:(BOOL)outputEnabled {
    _rfSignalGenerator->setOutputEnabled(outputEnabled);
}

- (BOOL)getOutputEnabled {
    return _rfSignalGenerator->getOutputEnabled();
}

- (NSString *)getStatus {
    return [NSString stringWithUTF8String:_rfSignalGenerator->getStatus().c_str()];
}

@end
