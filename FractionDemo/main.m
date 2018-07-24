//
//  main.m
//  FractionDemo
//
//  Created by Jesper Flodin on 2018-07-23.
//  Copyright © 2018 Jesper Flodin. All rights reserved.
//
#import "Fraction.h"

int main (int argc, const char *argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    Fraction *aFraction = [[Fraction alloc] init];
    Fraction *bFraction = [[Fraction alloc] init];
    Fraction *cFraction = [[Fraction alloc] init];
    
    [aFraction setNumerator:2 overDenominator:4];
    [bFraction setNumerator:1 overDenominator:3];
    cFraction = [Fraction fractionFromDecimal:0.7];
    
    NSLog(@"%g",[aFraction doubleValue]);
    NSLog(@"Using class method:");
    Fraction *classAddition = [Fraction addFraction:aFraction toFraction:bFraction];
    NSLog(@"%@", classAddition);
    NSLog(@"%@ * %@ = ",aFraction,bFraction);
    [aFraction multiply:bFraction];
    NSLog(@"%@", aFraction);
    NSLog(@"%@", cFraction);
    
    [aFraction release];
    [bFraction release];
    [pool drain];
    return 0;
}
