//
//  ViewController.m
//  TestStorybord_xib
//
//  Created by 白洋 on 16/1/15.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"

@interface ViewController ()


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)goToThreeXib:(id)sender {
    ThreeViewController * threeViewController = [[ThreeViewController alloc] initWithNibName:@"ThreeViewController" bundle:nil];
    [self presentViewController:threeViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//  Get the new view controller using [segue destinationViewController].
//  Pass the selected object to the new view controller.
     SecondViewController * secondViewController = segue.destinationViewController;
     secondViewController.name = @"Who r u ?";
 }

@end
