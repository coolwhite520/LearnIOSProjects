//
//  ViewController.m
//  MyTabBarController-01
//
//  Created by 白洋 on 16/1/29.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.tabBarController.tabBar.barTintColor = [UIColor blackColor];
    
    self.tabBarItem.badgeValue = @"100";
    self.tabBarController.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    if (viewController == self) {
        self.tabBarItem.badgeValue = nil;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
