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
+ (MixedNumber *)subtractMixedNumber:(MixedNumber *)num1 fromMixedNumber:(MixedNumber *)num2;
+ (MixedNumber *)multiplyMixedNumber:(MixedNumber *)num1 withMixedNumber:(MixedNumber *)num2;
+ (MixedNumber *)divideMixedNumber:(MixedNumber *)num1 byMixedNumber:(MixedNumber *)num2;

- (void)add:(MixedNumber *)newMixedNumber;
- (void)subtract:(MixedNumber *)newMixedNumber;
- (void)multiply:(MixedNumber *)newMixedNumber;
- (void)divide:(MixedNumber *)newMixedNumber;

- (void)setWholeNumber:(NSInteger)number andNumerator:(NSInteger)num overDenominator:(NSInteger)denom;
- (void)setWholeNumber:(NSInteger)number andFraction:(Fraction *)frac;

- (void)reduce;

- (NSString *)description;
@end
