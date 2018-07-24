//
//  MixedNumber.h
//  FractionDemo
//
//  Created by Jesper Flodin on 2018-07-24.
//  Copyright © 2018 Jesper Flodin. All rights reserved.
//
//#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface MixedNumber : Fraction;
@property NSInteger wholeNumber;

+ (MixedNumber *)addMixedNumber:(MixedNumber *)num1 toMixedNumber:(MixedNumber *)num2;

- (void)setWholeNumber:(NSInteger)number andNumerator:(NSInteger)num overDenominator:(NSInteger)denom;
- (void)setWholeNumber:(NSInteger)number andFraction:(Fraction *)frac;

- (NSString *)description;
@end
