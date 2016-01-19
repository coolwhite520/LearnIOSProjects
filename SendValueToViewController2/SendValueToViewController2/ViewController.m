//
//  ViewController.m
//  SendValueToViewController2
//
//  Created by 白洋 on 16/1/19.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController * secondviewController = segue.destinationViewController;
    [secondviewController setBlock:^(NSString *strText) {
        self.label.text = strText;
    }];
}

@end
