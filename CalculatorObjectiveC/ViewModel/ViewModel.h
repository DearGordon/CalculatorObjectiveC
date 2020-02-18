//
//  ViewModel.h
//  CalculatorObjectiveC
//
//  Created by Kuan-Chieh Feng on 2020/2/13.
//  Copyright © 2020 Kuan-Chieh Feng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject
{
    BOOL resetNumber;
}

@property Model * model;
@property (nonatomic) NSString * resultLabeltext;

@property (retain, nonatomic) NSDecimalNumber * leftNumber;
@property (retain, nonatomic) NSDecimalNumber * rightNumber;
@property (retain, nonatomic) NSDecimalNumber * resultDecNumber;
@property NSString * myOperator;


@property (nonatomic, copy) void(^reloadView)(void);
@property (nonatomic, copy) void(^doAlert)(void);

-(void)putNumber:(NSString*)myNumber;
-(void)putOperator:(NSString*)myOperator;
-(void)doClear;
-(void)doSwitchPosiAndNegati;
-(void)doResult;

@end

NS_ASSUME_NONNULL_END
