//
//  RFSignalGeneratorWrapper.h
//  RFTestEquipmentSimulator
//
//  Created by Jonah Duckworth on 2023-04-25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RFSignalGeneratorWrapper : NSObject

- (instancetype)init;
- (void)setFrequency:(double)frequency;
- (double)getFrequency;
- (void)setPowerLevel:(double)powerLevel;
- (double)getPowerLevel;
- (void)setOutputEnabled:(BOOL)outputEnabled;
- (BOOL)getOutputEnabled;
- (NSString *)getStatus;

@end

NS_ASSUME_NONNULL_END
