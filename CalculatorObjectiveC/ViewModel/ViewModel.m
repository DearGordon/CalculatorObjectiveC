//
//  ViewModel.m
//  CalculatorObjectiveC
//
//  Created by Kuan-Chieh Feng on 2020/2/13.
//  Copyright © 2020 Kuan-Chieh Feng. All rights reserved.
//

#import "ViewModel.h"

@interface ViewModel ()
@end

@implementation ViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.model = [Model new];
    }
    return self;
}

-(void)putNumber:(NSString*)myNumber
{
    if (appendingNumber) {
        <#statements#>
    }
    
    NSDecimalNumber * number = [NSDecimalNumber decimalNumberWithString:myNumber];
    if (self.leftNumber == nil) {
        self.leftNumber = number;
    } else {
        self.rightNumber = number;
    }
    self.resultDecNumber = number;
    self.resultLabeltext = [self deciNumToString:self.resultDecNumber];
    
    self.reloadView();
}

- (void)putOperator:(NSString *)myOperator
{
    if (self.leftNumber == nil) {
        return;
    }
    
    
    NSDictionary * selectorDict = [NSDictionary dictionaryWithObjectsAndKeys:
    @"decimalNumberByAdding:", @"+",
    @"decimalNumberBySubtracting:", @"-",
    @"decimalNumberByMultiplyingBy:", @"x",
    @"decimalNumberByDividingBy:", @"/",
    nil];
    
    if (self.rightNumber == nil) {
        self.myOperator = [selectorDict objectForKey:myOperator];
    } else {
        self.leftNumber = [self.model doOperation:self.myOperator :self.leftNumber :self.rightNumber];
        self.resultDecNumber = self.leftNumber;
        self.rightNumber = nil;
        self.myOperator = [selectorDict objectForKey:myOperator];
        
    }
    self.resultLabeltext = [self deciNumToString:self.resultDecNumber];

    self.reloadView();
}

- (void)doResult
{
    if (self.myOperator == nil || self.rightNumber == nil) {
        return;
    }
    self.resultDecNumber = [self.model doOperation:self.myOperator :self.leftNumber :self.rightNumber];
    self.resultLabeltext = [self deciNumToString:self.resultDecNumber];
    
    self.reloadView();
}

- (void)doClear
{
    self.rightNumber = nil;
    self.leftNumber = nil;
    self.myOperator = nil;
    self.resultDecNumber = nil;
    self.resultLabeltext = @"0";
    
    self.reloadView();
}

- (void)doSwitchPosiAndNegati
{
    NSDecimalNumber * negative = [NSDecimalNumber decimalNumberWithString:@"-1"];
    self.resultDecNumber =  [self.resultDecNumber decimalNumberByMultiplyingBy:negative];
    self.resultLabeltext = [self deciNumToString:self.resultDecNumber];
    
    self.reloadView();
}




-(NSString*)deciNumToString:(NSDecimalNumber*)number
{
    return [NSString stringWithFormat:@"%@",number];
}
 
@end
