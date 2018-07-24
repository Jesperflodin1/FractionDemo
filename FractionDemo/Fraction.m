//
//  Fraction.m
//  FractionDemo
//
//  Created by Jesper Flodin on 2018-07-23.
//  Copyright © 2018 Jesper Flodin. All rights reserved.
//
#import "Fraction.h"

@implementation Fraction
- (Fraction *)initWithNumerator:(int)numerator denominator:(int)denominator {
    if (denominator == 0) {
        __unused NSInteger divisionByZero = numerator/denominator;
    }
    self = [super init];
    if (self) {
        _numerator = numerator;
        _denominator = denominator;
    }
    return self;
}
- (Fraction *)init {
    return [self initWithNumerator:0 denominator:1];
}
+ (Fraction *)zero {
    return [[self alloc] init];
}
+ (Fraction *)one {
    return [[self alloc] initWithNumerator:1 denominator:1];
}
+ (Fraction *)fractionWithInteger:(int)integer {
    return [[self alloc] initWithNumerator:integer denominator:1];
}
+ (Fraction *)fractionWithNumerator:(int)numerator denominator:(int)denominator {
    return [[self alloc] initWithNumerator:numerator denominator:denominator];
}

- (void)setNumerator:(NSInteger)num overDenominator:(NSInteger)denom {
    _numerator = num;
    if (denom == 0) {
        // no reason to build a NSException object, just:
        __unused NSInteger divisionByZero = num/denom;
    }
    _denominator = denom;
}
+ (NSInteger)gcdForNumber1:(NSInteger)u andNumber2:(NSInteger)v {
    NSInteger temp = 0;
    // Euclid's procedure to find GCD (Greatest Common Denominator)
    
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    return u;
}
+ (Fraction *)addFraction:(Fraction *)frac1 toFraction:(Fraction *)frac2 {
    Fraction *result = [[[Fraction alloc] init] autorelease];
    
    NSInteger resultNum = frac1.numerator * frac2.denominator + frac1.denominator * frac2.numerator;
    NSInteger resultDenom = frac1.denominator * frac2.denominator;
    
    [result setNumerator:resultNum overDenominator:resultDenom];
    [result reduce];
    
    return result;
}
+ (Fraction *)subtractFraction:(Fraction *)frac1 fromFraction:(Fraction *)frac2 {
    //frac2 - frac1
    Fraction *result = [[[Fraction alloc] init] autorelease];

    NSInteger resultNum = frac2.numerator * frac1.denominator - frac2.denominator * frac1.numerator;
    NSInteger resultDenom = frac2.denominator * frac1.denominator;
    
    [result setNumerator:resultNum overDenominator:resultDenom];
    [result reduce];
    return result;
}
+ (Fraction *)multiplyFraction:(Fraction *)frac1 withFraction:(Fraction *)frac2 {
    Fraction *result = [[[Fraction alloc] init] autorelease];
    
    NSInteger resultNum = frac1.numerator * frac2.numerator;
    NSInteger resultDenom = frac1.denominator * frac2.denominator;
    
    [result setNumerator:resultNum overDenominator:resultDenom];
    [result reduce];
    return result;
}
+ (Fraction *)divideFraction:(Fraction *)frac1 byFraction:(Fraction *)frac2 {
    Fraction *result = [[[Fraction alloc] init] autorelease];

    NSInteger resultNum = frac1.numerator * frac2.denominator;
    NSInteger resultDenom = frac1.denominator * frac2.numerator;
    
    [result setNumerator:resultNum overDenominator:resultDenom];
    [result reduce];
    return result;
}

+ (Fraction *)fractionFromDecimal:(double)decimal {
    Fraction *result = [[[Fraction alloc] init] autorelease];
    
    NSString *decimalString = [NSString stringWithFormat:@"%f", decimal];
    NSArray *components = [decimalString componentsSeparatedByString:@"."];
    NSInteger decimalLength = [[components objectAtIndex:1] length];
    
    int n = 10;
    while (decimalLength!= 1) {
        n *= 10;
        decimalLength -- ;
    }
    int m = [[components objectAtIndex:1] intValue];
    NSInteger gcd = [Fraction gcdForNumber1:m andNumber2:n];
    int numer = m/gcd;
    int deno = n/gcd;
    int fractionnumer = ([[components objectAtIndex:0] intValue] * deno) + numer;
    [result setNumerator:fractionnumer overDenominator:deno];
    
    return result;
}

- (void)add:(Fraction *)newFraction {
    // a/b + c/d = ((a * d) + (b * c)) / (b * d)
    self.numerator = self.numerator * newFraction.denominator + self.denominator * newFraction.numerator;
    self.denominator = self.denominator * newFraction.denominator;
    
    [self reduce];
}
- (void)subtract:(Fraction *)newFraction {
    // a/b - c/d = (a*d-b*c)/b*d
    self.numerator = self.numerator * newFraction.denominator - self.denominator * newFraction.numerator;
    self.denominator = self.denominator * newFraction.denominator;
    
    [self reduce];
}
- (void)multiply:(Fraction *)newFraction {
    // a/b * c/d = (a*c)/(b*d)
    self.numerator = self.numerator * newFraction.numerator;
    self.denominator = self.denominator * newFraction.denominator;
    
    [self reduce];
}
- (void)divide:(Fraction *)newFraction {
    // (a/b)/(c/d) = ad/bc
    self.numerator = self.numerator * newFraction.denominator;
    self.denominator = self.denominator * newFraction.numerator;
    
    [self reduce];
}

- (double) doubleValue {
    if (self.denominator) return (double) self.numerator / self.denominator;
    else return NAN;
}
- (void)reduce {
    NSInteger gcd = [Fraction gcdForNumber1:self.numerator andNumber2:self.denominator];
    self.numerator /= gcd;
    self.denominator /= gcd;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%li/%li",(long) self.numerator, (long)self.denominator];
}
@end
