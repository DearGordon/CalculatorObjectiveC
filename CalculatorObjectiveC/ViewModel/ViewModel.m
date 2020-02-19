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
        _resultDecNumber = [self readLabelText];
        _resultDecNumber = [self.model doOperation:@"x" :_resultDecNumber :ten];
        [self setView:_resultDecNumber];
        resetNumber = NO;
        return;
    }
    
    if (!_leftNumber) {
        _leftNumber = [self readLabelText];
        _resultDecNumber = _leftNumber;
        _myOperator = newOperator;
        _rightNumber = nil;
        
    } else if (!_rightNumber) {
        _rightNumber = [self readLabelText];
        
        if ([self checkCalculation] && _myOperator != nil) {
            _resultDecNumber = [self.model doOperation:_myOperator :_leftNumber :_rightNumber];
            _rightNumber = nil;
            _leftNumber = _resultDecNumber;
        }
        if (_resultDecNumber) { [self setView:_resultDecNumber]; }
        _myOperator = newOperator;
        resetNumber = YES;
        return;
    } else {
        _myOperator = newOperator;
    }
    
    if (_resultDecNumber) { [self setView:_resultDecNumber]; }
    
    resetNumber = YES;
}

- (void)doResult
{
    if (_myOperator == nil) {
        return;
    }
    _rightNumber = [self readLabelText];
    
    if ([self checkCalculation] && _myOperator != nil) {
        _resultDecNumber = [self.model doOperation:_myOperator :_leftNumber :_rightNumber];
    }
    [self setView:_resultDecNumber];
    
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
    NSDecimalNumber * negative = [NSDecimalNumber decimalNumberWithString:@"-1"];
    _resultDecNumber = [self readLabelText];
    [self setView:[self.model doOperation:@"x" :_resultDecNumber :negative]];
    _myOperator = nil;
    resetNumber = NO;
}

-(NSDecimalNumber*)readLabelText
{
    return [NSDecimalNumber decimalNumberWithString:_resultLabeltext];
}

-(BOOL)checkCalculation
{
    if ([_myOperator isEqualToString:@"/"] && [_rightNumber floatValue] == 0) {
        _doAlert();
        return false;
    }
    return true;
}

-(void)setView:(NSDecimalNumber*)number
{
    _resultDecNumber = number;
    _resultLabeltext = [NSString stringWithFormat:@"%@",number];
    _reloadView();
}

@end
