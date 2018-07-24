//
//  MixedNumber.m
//  FractionDemo
//
//  Created by Jesper Flodin on 2018-07-24.
//  Copyright © 2018 Jesper Flodin. All rights reserved.
//

#import "MixedNumber.h"

@implementation MixedNumber
- (MixedNumber *)init {
    return [self initWithWholeNumber:0 numerator:0 denominator:1];
}
- (MixedNumber *)initWithWholeNumber:(NSInteger)number numerator:(NSInteger)num denominator:(NSInteger)denom {
    if (denom == 0) {
        __unused NSInteger divisionByZero = num/denom;
    }
    self = [super init];
    if (self) {
        self.wholeNumber = number;
        self.numerator = num;
        self.denominator = denom;
    }
    return self;
}
- (MixedNumber *)initWithWholeNumber:(NSInteger)number andFraction:(Fraction *)fraction {
    if ([fraction denominator] == 0) {
        __unused NSInteger divisionByZero = [fraction numerator]/[fraction denominator];
    }
    self = [super init];
    if (self) {
        self.wholeNumber = number;
        self.numerator = [fraction numerator];
        self.denominator = [fraction denominator];
    }
    return self;
}
- (MixedNumber *)initWithFraction:(Fraction *)fraction {
    if ([fraction denominator] == 0) {
        __unused NSInteger divisionByZero = [fraction numerator]/[fraction denominator];
    }
    self = [super init];
    if (self) {
        NSInteger number = [fraction numerator]/[fraction denominator]; // whole number. decimals are lost.
        self.wholeNumber = number;
        self.numerator = [fraction numerator] - number * [fraction denominator];
        self.denominator = [fraction denominator];
    }
    return self;
}

- (Fraction *)convertToFraction {
    Fraction *result = [Fraction fractionWithNumerator:[self denominator]*[self wholeNumber]+[self numerator]
                                           denominator:[self denominator]];
    [result reduce];
    return result;
}
+ (MixedNumber *)zero {
    return [[self alloc] init];
}
+ (MixedNumber *)mixedNumberWithWholeNumber:(int)number numerator:(int)num denominator:(int)denom {
    return [[self alloc] initWithWholeNumber:number numerator:num denominator:denom];
}
+ (MixedNumber *)mixedNumberWithWholeNumber:(int)number andFraction:(Fraction *)fraction {
    return [[self alloc] initWithWholeNumber:number andFraction:fraction];
}
+ (MixedNumber *)mixedNumberWithFraction:(Fraction *)fraction {
    return [[self alloc] initWithFraction:fraction];
}


+ (MixedNumber *)addMixedNumber:(MixedNumber *)num1 toMixedNumber:(MixedNumber *)num2 {
    MixedNumber *result = [[[MixedNumber alloc] init] autorelease];
    [result setWholeNumber: [num1 wholeNumber] + [num2 wholeNumber]];
    [result setNumerator: [num1 numerator] * [num2 denominator] + [num1 denominator] * [num2 numerator]];
    [result setDenominator: [num1 denominator] * [num2 denominator]];
    
    [result reduce];
    return result;
}
+ (MixedNumber *)subtractMixedNumber:(MixedNumber *)num1 fromMixedNumber:(MixedNumber *)num2 {
    MixedNumber *result = [[[MixedNumber alloc] init] autorelease];
    [result setWholeNumber: [num2 wholeNumber] - [num1 wholeNumber]];
    [result setNumerator: [num2 numerator] * [num1 denominator] - [num2 denominator] * [num1 numerator]];
    [result setDenominator: [num2 denominator] * [num1 denominator]];
    
    [result reduce];
    return result;
}
+ (MixedNumber *)multiplyMixedNumber:(MixedNumber *)num1 withMixedNumber:(MixedNumber *)num2 {
    return [MixedNumber mixedNumberWithFraction:
            [Fraction multiplyFraction:[num1 convertToFraction]
                          withFraction:[num2 convertToFraction]]];
}
+ (MixedNumber *)divideMixedNumber:(MixedNumber *)num1 byMixedNumber:(MixedNumber *)num2 {
    return [MixedNumber mixedNumberWithFraction:
            [Fraction divideFraction:[num1 convertToFraction]
                          byFraction:[num2 convertToFraction]]];
}

- (void)add:(MixedNumber *)newMixedNumber {
    [self setWholeNumber: [self wholeNumber] + [newMixedNumber wholeNumber]];
    [self setNumerator: [self numerator] * [newMixedNumber denominator] + [self denominator] * [newMixedNumber numerator]];
    [self setDenominator: [self denominator] * [newMixedNumber denominator]];
    
    [self reduce];
}
- (void)subtract:(MixedNumber *)newMixedNumber {
    [self setWholeNumber: [self wholeNumber] - [newMixedNumber wholeNumber]];
    [self setNumerator: [self numerator] * [newMixedNumber denominator] - [self denominator] * [newMixedNumber numerator]];
    [self setDenominator: [self denominator] * [newMixedNumber denominator]];
    
    [self reduce];
}
- (void)multiply:(MixedNumber *)newMixedNumber {
    MixedNumber *fractionResult = [MixedNumber mixedNumberWithFraction:
                                   [Fraction multiplyFraction:[self convertToFraction]
                                             withFraction:[newMixedNumber convertToFraction]]];
    [self setWholeNumber:[fractionResult wholeNumber]];
    [self setNumerator:[fractionResult numerator]];
    [self setDenominator:[fractionResult denominator]];
}
- (void)divide:(MixedNumber *)newMixedNumber {
    MixedNumber *fractionResult = [MixedNumber mixedNumberWithFraction:
                                   [Fraction divideFraction:[self convertToFraction]
                                                 byFraction:[newMixedNumber convertToFraction]]];
    [self setWholeNumber:[fractionResult wholeNumber]];
    [self setNumerator:[fractionResult numerator]];
    [self setDenominator:[fractionResult denominator]];
}

- (void)setWholeNumber:(NSInteger)number andNumerator:(NSInteger)num overDenominator:(NSInteger)denom {
    if (denom == 0) {
        __unused NSInteger divisionByZero = num/denom;
    }
    self.wholeNumber = number;
    self.numerator = num;
    self.denominator = denom;
}
- (void)setWholeNumber:(NSInteger)number andFraction:(Fraction *)frac {
    self.wholeNumber = number;
    self.numerator = frac.numerator;
    self.denominator = frac.denominator;
}

- (void)reduce {
    if (self.numerator >= self.denominator) {
        NSInteger extra = self.numerator / self.denominator;
        self.wholeNumber += extra;    // Taking advantage of integer division
        self.numerator -= extra * self.denominator;
    }
    [super reduce];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%li + %li/%li",(long)self.wholeNumber ,(long)self.numerator, (long)self.denominator];
}

@end
