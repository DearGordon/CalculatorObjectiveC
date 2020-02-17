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
    SEL seletor = NSSelectorFromString(myOperator);
    NSDecimalNumber * result = [leftNumber performSelector:seletor withObject:rightNumber];
    
    return result;
}




@end
//    NSString * text = [sender titleLabel].text;
    
//    if (self.leftNumber == NULL) {
//        self.leftNumber = [NSDecimalNumber decimalNumberWithString:text];
//    } else {
//        self.rightNumber = [NSDecimalNumber decimalNumberWithString:text];
//    }
//    if (self.leftNumber != NULL, self.rightNumber != NULL) {
//        self.leftNumber = [self.leftNumber decimalNumberByAdding:self.rightNumber];
//    }
//
//    NSLog(@"left=%@,right=%@",self.leftNumber,self.rightNumber);
