//
//  ViewController.m
//  MyUIAlertViewTest
//
//  Created by 白洋 on 16/1/20.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clickMe:(id)sender{
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"TIP" message:@"您确定真的要将背景设为红色？" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"YES", nil];
    [alertView show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(10,100,200, 20)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"ClickMe" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            self.view.backgroundColor = [UIColor whiteColor];
            break;
        case 1:
            self.view.backgroundColor = [UIColor redColor];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
