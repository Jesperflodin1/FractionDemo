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
    return [self initWithNumerator:0 denominator:1];
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
    MixedNumber *result = [[[MixedNumber alloc] init] autorelease];
    // (a+b/c)*(d+e/f)
    return result;
}
+ (MixedNumber *)divideMixedNumber:(MixedNumber *)num1 byMixedNumber:(MixedNumber *)num2 {
    MixedNumber *result = [[[MixedNumber alloc] init] autorelease];
    return result;
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
    
}
- (void)divide:(MixedNumber *)newMixedNumber {
    
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
