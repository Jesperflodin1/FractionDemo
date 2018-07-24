//
//  MixedNumber.m
//  FractionDemo
//
//  Created by Jesper Flodin on 2018-07-24.
//  Copyright © 2018 Jesper Flodin. All rights reserved.
//

#import "MixedNumber.h"

@implementation MixedNumber

+ (MixedNumber *)addMixedNumber:(MixedNumber *)num1 toMixedNumber:(MixedNumber *)num2 {
    // Store result in "result"
    MixedNumber *result = [[[MixedNumber alloc] init] autorelease];
    result.wholeNumber = num1.wholeNumber + num2.wholeNumber;
    result.numerator = num1.numerator * num2.denominator + num1.denominator * num2.numerator;
    result.denominator = num1.denominator * num2.denominator;
    
    // Reduce
    if (result.numerator > result.denominator) {
        NSInteger extra = result.numerator / result.denominator;
        result.wholeNumber += extra;    // Taking advantage of integer division
        result.numerator -= extra * result.denominator;
        
        NSInteger u = result.numerator;
        NSInteger v = result.denominator;
        NSInteger temp = 0;
        
        // Euclid's procedure to find GCD (Greatest Common Denominator)
        // Don't worry about how this works, exactly.
        
        while (v != 0) {
            temp = u % v;
            u = v;
            v = temp;
        }
        
        result.numerator /= u;
        result.denominator /= u;
    }
    
    return result;
}

- (void)setWholeNumber:(NSInteger)number andNumerator:(NSInteger)num overDenominator:(NSInteger)denom {
    self.wholeNumber = number;
    self.numerator = num;
    self.denominator = denom;
}
- (void)setWholeNumber:(NSInteger)number andFraction:(Fraction *)frac {
    self.wholeNumber = number;
    self.numerator = frac.numerator;
    self.denominator = frac.denominator;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%li + %li/%li",(long)self.wholeNumber ,(long)self.numerator, (long)self.denominator];
}

@end
