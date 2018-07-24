//
//  MixedNumber.m
//  FractionDemo
//
//  Created by Jesper Flodin on 2018-07-24.
//  Copyright © 2018 Jesper Flodin. All rights reserved.
//

#import "MixedNumber.h"

@implementation MixedNumber

- (void)setWholeNumber:(NSInteger)number andNumerator:(NSInteger)num andDenominator:(NSInteger)denom {
    self.WholeNumber = number;
    self.numerator = num;
    self.denominator = denom;
}
@end
