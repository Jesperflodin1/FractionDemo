//
//  main.m
//  FractionDemo
//
//  Created by Jesper Flodin on 2018-07-23.
//  Copyright © 2018 Jesper Flodin. All rights reserved.
//
#import "Fraction.h"
#import "MixedNumber.h"

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
    
    // bFraction is declared previously
    MixedNumber *aMixedNum = [[MixedNumber alloc] init];
    MixedNumber *bMixedNum = [[MixedNumber alloc] init];
    [aMixedNum setWholeNumber:3 andNumerator:2 overDenominator:4];
    [bMixedNum setWholeNumber:4 andFraction:bFraction];
    
    NSLog(@"aMixedNum is %@", aMixedNum);
    // Uses Fraction's reduce method on the fractional portion of MixedNumber
    NSLog(@"After reducing, aMixedNum is"); [aMixedNum reduce]; NSLog(@"%@",aMixedNum);
    
    NSLog(@"Addition: ");
    NSLog(@"%@",aMixedNum); NSLog(@" + "); NSLog(@"%@",bMixedNum); NSLog(@" = ");
    NSLog(@"%@",[MixedNumber addMixedNumber:aMixedNum toMixedNumber:bMixedNum]);
    // display is invoked on the return value of the add method
    
    [aMixedNum release];
    [bMixedNum release];
    
    [aFraction release];
    [bFraction release];
    [cFraction release];
    //[pool drain];
    return 0;
}
