//
//  MixedNumber.h
//  FractionDemo
//
//  Created by Jesper Flodin on 2018-07-24.
//  Copyright © 2018 Jesper Flodin. All rights reserved.
//
#import "Fraction.h"

@interface MixedNumber : Fraction;
@property NSInteger wholeNumber;
- (MixedNumber *)init;
- (MixedNumber *)initWithWholeNumber:(NSInteger)number numerator:(NSInteger)num denominator:(NSInteger)denom;
- (MixedNumber *)initWithWholeNumber:(NSInteger)number andFraction:(Fraction *)fraction;
- (MixedNumber *)initWithFraction:(Fraction *)fraction;
- (Fraction *)convertToFraction;

+ (MixedNumber *)zero;
+ (MixedNumber *)mixedNumberWithWholeNumber:(int)number numerator:(int)num denominator:(int)denom;
+ (MixedNumber *)mixedNumberWithWholeNumber:(int)number andFraction:(Fraction *)fraction;
+ (MixedNumber *)mixedNumberWithFraction:(Fraction *)fraction;

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
