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
 
- (void)setResultLabeltest:(NSString *)resultLabeltest
{
    
}

-(void)doOperation
{
    self.model = [Model new];
    [self.model test];
}


@end
