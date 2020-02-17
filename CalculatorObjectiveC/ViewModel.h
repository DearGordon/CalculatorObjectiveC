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

@property Model * model;
@property (nonatomic) NSString * resultLabeltest;

@property (retain, nonatomic) NSDecimalNumber * leftNumber;
@property (retain, nonatomic) NSDecimalNumber * rightNumber;

-(void)doOperation;

@end

NS_ASSUME_NONNULL_END
