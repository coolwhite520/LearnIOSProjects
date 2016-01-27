//
//  SecondViewController.m
//  MyViewControllerJump
//
//  Created by 白洋 on 16/1/27.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

-(IBAction)go3:(id)sender{
    ThirdViewController * second = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:second animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第2个视图";
    // Do any additional setup after loading the view.
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 100, 90, 36);
    [btn setTitle:@"Go3" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(go3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
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
