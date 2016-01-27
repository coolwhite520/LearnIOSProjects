//
//  FirstViewController.m
//  MyViewControllerJump
//
//  Created by 白洋 on 16/1/27.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end


@implementation FirstViewController

-(IBAction)go2:(id)sender{
    SecondViewController * second = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:second animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第1个视图";
    // Do any additional setup after loading the view.
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 100, 90, 36);
    [btn setTitle:@"Go2" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(go2:) forControlEvents:UIControlEventTouchUpInside];
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
