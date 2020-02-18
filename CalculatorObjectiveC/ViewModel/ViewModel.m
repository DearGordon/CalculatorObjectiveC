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
        _model = [Model new];
        _resultLabeltext = @"0";
    }
    return self;
}

-(void)putNumber:(NSString*)myNumber
{
    if (resetNumber) {
        _resultLabeltext = @"0";
        resetNumber = NO;
    }
    
    if ([myNumber isEqualToString:@"."]) {
        if ([_resultLabeltext rangeOfString:@"."].location == NSNotFound) {
            _resultLabeltext = [_resultLabeltext stringByAppendingString:@"."];
            _reloadView();
        }
        return;
    }
    
    if ([_resultLabeltext isEqualToString:@"0"]) {
        if ([myNumber isEqualToString:@"0"]) {
            return;
        }
        _resultLabeltext = myNumber;
    } else {
        _resultLabeltext = [_resultLabeltext stringByAppendingString:myNumber];
        
    }
    _reloadView();
}

- (void)putOperator:(NSString *)newOperator
{
    
    if ([newOperator isEqualToString:@"%"]) {
        NSDecimalNumber * ten = [NSDecimalNumber decimalNumberWithString:@"0.1"];
        _resultDecNumber = [NSDecimalNumber decimalNumberWithString:_resultLabeltext];
        _resultDecNumber = [_resultDecNumber decimalNumberByMultiplyingBy:ten];
        
        [self setTextView:_resultDecNumber];
        resetNumber = NO;
        return;
    }
    
    if (!_leftNumber) {
        _leftNumber = [NSDecimalNumber decimalNumberWithString:_resultLabeltext];
        _resultDecNumber = _leftNumber;
        _myOperator = newOperator;
        _rightNumber = nil;
        NSLog(@"!_leftNumber L:%@,O:%@,R:%@",_leftNumber,_myOperator,_rightNumber);
        
    } else if (!_rightNumber) {
        _rightNumber = [NSDecimalNumber decimalNumberWithString:_resultLabeltext];
        
        if ([self checkCalculation] && _myOperator != nil) {
            _resultDecNumber = [self.model doOperation:_myOperator :_leftNumber :_rightNumber];
            _rightNumber = nil;
            _leftNumber = _resultDecNumber;
        }
        
        _myOperator = newOperator;
        NSLog(@"else L:%@,O:%@,R:%@,Result:%@",_leftNumber,_myOperator,_rightNumber,_resultDecNumber);
        resetNumber = YES;
        return;
    } else {
        _myOperator = newOperator;
    }
    
    if (_resultDecNumber) { [self setTextView:_resultDecNumber]; }
    
    resetNumber = YES;
}

- (void)doResult
{
    if (_myOperator == nil) {
        return;
    }
    _rightNumber = [NSDecimalNumber decimalNumberWithString:_resultLabeltext];
    
    if ([self checkCalculation] && _myOperator != nil) {
        _resultDecNumber = [self.model doOperation:_myOperator :_leftNumber :_rightNumber];
    }
    [self setTextView:_resultDecNumber];
    
    _rightNumber = nil;
    _leftNumber = nil;
    _resultDecNumber = nil;
    _myOperator = nil;
    resetNumber = YES;
}

- (void)doClear
{
    _rightNumber = nil;
    _leftNumber = nil;
    _myOperator = nil;
    _resultDecNumber = nil;
    _resultLabeltext = @"0";
    
    resetNumber = NO;
    _reloadView();
}

- (void)doSwitchPosiAndNegati
{
//    NSString *s = _resultLabeltext;
//    _resultLabeltext = [s hasPrefix:@"-"] ? [s substringFromIndex:1] : [@"-" stringByAppendingString:s];
    
    
    NSDecimalNumber * negative = [NSDecimalNumber decimalNumberWithString:@"-1"];
    _resultDecNumber = [NSDecimalNumber decimalNumberWithString:_resultLabeltext];
     
    
    [self setTextView:[_resultDecNumber decimalNumberByMultiplyingBy:negative]];
    
    _myOperator = nil;
    resetNumber = NO;
}

-(BOOL)checkCalculation
{
    if ([_myOperator isEqualToString:@"/"] && [_rightNumber floatValue] == 0) {
        _doAlert();
        return false;
    }
    return true;
}

-(void)setTextView:(NSDecimalNumber*)number
{
    _resultDecNumber = number;
    _resultLabeltext = [NSString stringWithFormat:@"%@",number];
    _reloadView();
}

@end
