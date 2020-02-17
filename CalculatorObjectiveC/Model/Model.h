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

-(void)doOperation:(NSDecimalNumber*)leftNumber :(NSDecimalNumber*)rightNumber;
-(void)test;

@end

NS_ASSUME_NONNULL_END
