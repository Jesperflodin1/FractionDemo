//
//  Fraction.h
//  FractionDemo
//
//  Created by Jesper Flodin on 2018-07-23.
//  Copyright © 2018 Jesper Flodin. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Fraction : NSObject
@property NSInteger numerator;
@property NSInteger denominator;
+ (Fraction *)addFraction:(Fraction *)frac1 toFraction:(Fraction *)frac2;
+ (Fraction *)subtractFraction:(Fraction *)frac1 fromFraction:(Fraction *)frac2;
+ (Fraction *)multiplyFraction:(Fraction *)frac1 withFraction:(Fraction *)frac2;
+ (Fraction *)divideFraction:(Fraction *)frac1 byFraction:(Fraction *)frac2;
+ (Fraction *)fractionFromDecimal:(double)decimal;
+ (int)gcdForNumber1:(int)m andNumber2:(int)n;

//- (void)display;
- (NSString *)description;
- (void)setNumerator:(NSInteger)num overDenominator:(NSInteger)denom;
- (double)doubleValue;

- (void)add:(Fraction *)newFraction;
- (void)subtract:(Fraction *)newFraction;
- (void)multiply:(Fraction *)newFraction;
- (void)divide:(Fraction *)newFraction;

- (void)reduce;
@end