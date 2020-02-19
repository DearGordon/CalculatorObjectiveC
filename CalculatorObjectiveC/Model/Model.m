//
//  Model.m
//  CalculatorObjectiveC
//
//  Created by Gordon Feng on 14/2/20.
//  Copyright © 2020 Kuan-Chieh Feng. All rights reserved.
//

#import "Model.h"


@implementation Model

- (NSDecimalNumber *)doOperation:(NSString *)myOperator :(NSDecimalNumber *)leftNumber :(NSDecimalNumber *)rightNumber
{
    NSDecimalNumber * result = [NSDecimalNumber new];
    if ([myOperator isEqualToString:@"+"]) {
        result = [leftNumber decimalNumberByAdding:rightNumber];
    }
    
    if ([myOperator isEqualToString:@"-"]) {
        result = [leftNumber decimalNumberBySubtracting:rightNumber];
    }
    
    if ([myOperator isEqualToString:@"x"]) {
        result = [leftNumber decimalNumberByMultiplyingBy:rightNumber];
    }
    
    if ([myOperator isEqualToString:@"/"]) {
        result = [leftNumber decimalNumberByDividingBy:rightNumber];
    }
    
    return result;
}




@end
