//
//  ViewController.m
//  Block2
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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//
    SecondViewController * secondViewController = segue.destinationViewController;
    secondViewController.firstViewController = self;
}

@end
