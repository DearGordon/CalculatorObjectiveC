//
//  ViewController.h
//  CalculatorObjectiveC
//
//  Created by Kuan-Chieh Feng on 2020/2/13.
//  Copyright © 2020 Kuan-Chieh Feng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"

@interface ViewController : UIViewController

@property ViewModel * viewModel;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property NSDecimalNumber * leftNumber;
@property NSDecimalNumber * rightNumber;

@end

