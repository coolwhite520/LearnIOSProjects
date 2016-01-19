//
//  SecondViewController.m
//  Block2
//
//  Created by 白洋 on 16/1/19.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (IBAction)btnSwithToFirst:(id)sender {
    self.firstViewController.view.backgroundColor = [UIColor redColor];
    [self dismissViewControllerAnimated:YES completion:nil];	
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
