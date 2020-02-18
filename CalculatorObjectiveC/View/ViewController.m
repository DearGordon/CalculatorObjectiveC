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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.viewModel = [ViewModel new];
    [self bindViewModel];
}

-(void)bindViewModel
{
    __weak typeof (self) weakSelf = self;
    
    [self.viewModel setDoAlert:^{
        __strong typeof (self) strongSelf = weakSelf;
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Not go this way" message:@"can't devide 0" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
        [strongSelf presentViewController:alert animated:true completion:nil];
    }];
    
    [self.viewModel setReloadView:^{
        __strong typeof (self) strongSelf = weakSelf;
        strongSelf.resultLabel.text =  strongSelf.viewModel.resultLabeltext;
    }];
}

- (IBAction)numberTextBtn:(id)sender
{
    //numbers
    [self.viewModel putNumber:[sender titleLabel].text];
}

- (IBAction)doResult:(id)sender
{
    //=
    [self.viewModel doResult];
}

- (IBAction)operator:(id)sender
{
    //+-*/%
    [self.viewModel putOperator:[sender titleLabel].text];
}

- (IBAction)clear:(id)sender
{
    //AC
    [self.viewModel doClear];
}

- (IBAction)switchPosiAndNegati:(id)sender
{
    //-/+
    [self.viewModel doSwitchPosiAndNegati];
}



@end
