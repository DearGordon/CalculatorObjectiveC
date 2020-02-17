//
//  Model.h
//  CalculatorObjectiveC
//
//  Created by Gordon Feng on 14/2/20.
//  Copyright © 2020 Kuan-Chieh Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
{
    SEL * selector;
}

@property (retain, nonatomic) NSDecimalNumber * leftNumber;
@property (retain, nonatomic) NSDecimalNumber * rightNumber;
@property NSDictionary * selectorDict;
@property NSString * resulText;

//-(NSDecimalNumber*)putNumber:(NSDecimalNumber*)myNumber;
-(NSDecimalNumber*)doOperation:(NSString*)myOperator :(NSDecimalNumber*)leftNumber :(NSDecimalNumber*)rightNumber;
//-(NSDecimalNumber*)clear;
//-(NSDecimalNumber*)doSwitchPosiAndNegati;
//-(NSDecimalNumber*)doResult;

//-(NSDecimalNumber*)result;


@end

NS_ASSUME_NONNULL_END
