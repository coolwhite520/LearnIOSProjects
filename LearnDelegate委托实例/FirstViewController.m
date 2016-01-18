//
//  OneViewController.m
//  LearnDelegate
//
//  Created by 白洋 on 16/1/15.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第一个视图控制器";
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    UIButton * btnSwithToSecondView = [[UIButton alloc] initWithFrame:CGRectMake(10, 90, [[UIScreen mainScreen] bounds].size.width - 10, 50)];
    [btnSwithToSecondView setTitle:@"去第二个view" forState:UIControlStateNormal];
    [btnSwithToSecondView addTarget:self action:@selector(switchToSecondView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSwithToSecondView];
    
    // Do any additional setup after loading the view.
}
- (void)setColorToFirstView:(UIColor *)color
{
    self.view.backgroundColor = color;
}

- (void)switchToSecondView
{
    SecondViewController * secondViewController = [[SecondViewController alloc] init];
    secondViewController.delegate = self;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
