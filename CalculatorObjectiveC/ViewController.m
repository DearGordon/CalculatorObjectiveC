//
//  ViewController.m
//  CalculatorObjectiveC
//
//  Created by Kuan-Chieh Feng on 2020/2/13.
//  Copyright © 2020 Kuan-Chieh Feng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)numberTextBtn:(id)sender {
    NSString * text = [sender titleLabel].text;
    
    if (self.leftNumber == NULL) {
        self.leftNumber = [NSDecimalNumber decimalNumberWithString:text];
    } else {
        self.rightNumber = [NSDecimalNumber decimalNumberWithString:text];
    }
    if (self.leftNumber != NULL, self.rightNumber != NULL) {
        self.leftNumber = [self.leftNumber decimalNumberByAdding:self.rightNumber];
    }
    
    NSLog(@"left=%@,right=%@",self.leftNumber,self.rightNumber);
}

- (IBAction)doResult:(id)sender {
}

- (IBAction)operator:(id)sender {
}

- (IBAction)clear:(id)sender {
}

- (IBAction)percent:(id)sender {
}

- (IBAction)switchPosiAndNegati:(id)sender {
}



@end
