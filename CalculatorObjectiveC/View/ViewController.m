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
    self.viewModel = [ViewModel new];
    [self bindViewModel];
}

-(void)bindViewModel
{
    [self.viewModel setReloadView:^{
        self.resultLabel.text = self.viewModel.resultLabeltext;
    }];
}

- (IBAction)numberTextBtn:(id)sender
{
    //numbers
    [self.viewModel putNumber:[sender titleLabel].text];
}

- (IBAction)doResult:(id)sender {
    //=
    [self.viewModel doResult];
}

- (IBAction)operator:(id)sender {
    //+-*/%
    [self.viewModel putOperator:[sender titleLabel].text];
}

- (IBAction)clear:(id)sender {
    //AC
    [self.viewModel doClear];
}

- (IBAction)switchPosiAndNegati:(id)sender {
    //-/+
    [self.viewModel doSwitchPosiAndNegati];
}



@end
