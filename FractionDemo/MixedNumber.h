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
@property NSInteger WholeNumber;

- (void)setWholeNumber:(NSInteger)number andNumerator:(NSInteger)num andDenominator:(NSInteger)denom;


@end
