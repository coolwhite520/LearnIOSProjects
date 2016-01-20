//
//  SecondViewController.m
//  SendValueToViewController2
//
//  Created by 白洋 on 16/1/19.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)editDidOnExit:(UIResponder*)sender{
    [sender resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
    self.sendBlock(self.textField.text);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textField addTarget:self action:@selector(editDidOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (IBAction)btnSwitchToFirst:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.sendBlock(self.textField.text);
}

-(void)setBlock:(SendTextBlock)block{
    self.sendBlock = block;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
