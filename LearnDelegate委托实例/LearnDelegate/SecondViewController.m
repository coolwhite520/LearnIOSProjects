//
//  SecondViewController.m
//  LearnDelegate
//
//  Created by 白洋 on 16/1/15.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第二个视图控制器";
    UIButton * btnYello = [[UIButton alloc] initWithFrame:CGRectMake(10, 90, [[UIScreen mainScreen] bounds].size.width -10 , 60)];
    btnYello.backgroundColor = [UIColor yellowColor];
    [btnYello setTitle:@"Yello" forState:UIControlStateNormal];
    [btnYello addTarget:self action:@selector(btnSwitchToFirstView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * btnRed = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, [[UIScreen mainScreen] bounds].size.width -10 , 60)];
    btnRed.backgroundColor = [UIColor redColor];
    [btnRed setTitle:@"Red" forState:UIControlStateNormal];
    [btnRed addTarget:self action:@selector(btnSwitchToFirstView:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnYello];
    [self.view addSubview:btnRed];
    
}

- (void)btnSwitchToFirstView:(UIButton*) btn
{
    [self.navigationController popViewControllerAnimated:YES];
//    判断是否实现了这个方法，否则程序崩溃
    if (![self.delegate respondsToSelector:@selector(setColorToFirstView:)]) {
        return;
    }
    [self.delegate setColorToFirstView:btn.backgroundColor];
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
