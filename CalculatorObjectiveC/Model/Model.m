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
    NSDictionary * selectorDict = [NSDictionary dictionaryWithObjectsAndKeys:
    @"decimalNumberByAdding:", @"+",
    @"decimalNumberBySubtracting:", @"-",
    @"decimalNumberByMultiplyingBy:", @"x",
    @"decimalNumberByDividingBy:", @"/",
    nil];
    
   NSString * operatorObject = [selectorDict objectForKey:myOperator];
    
    SEL seletor = NSSelectorFromString(operatorObject);
    
    NSDecimalNumber * result = [leftNumber performSelector:seletor withObject:rightNumber];
    
    return result;
}




@end
