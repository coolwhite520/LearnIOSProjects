//
//  ViewController.m
//  MyUISegementedControl
//
//  Created by 白洋 on 16/1/20.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UISegmentedControl * seg;
@end

@implementation ViewController
- (IBAction)changed:(UISegmentedControl *)sender {
    UISegmentedControl * segCtl = sender;
    switch (segCtl.selectedSegmentIndex) {
        case 0:
            NSLog(@"%@....",[segCtl titleForSegmentAtIndex:segCtl.selectedSegmentIndex]);
            break;
        case 1:
            NSLog(@"%@....",[segCtl titleForSegmentAtIndex:segCtl.selectedSegmentIndex]);
            break;
        case 2:
            NSLog(@"%@....",[segCtl titleForSegmentAtIndex:segCtl.selectedSegmentIndex]);
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.seg = [[UISegmentedControl alloc]initWithItems:@[@"风景",@"特效",@"品牌"]];
    self.seg.frame = CGRectMake(10, 400, 400, 30);
    [self.seg addTarget:self action:@selector(changed:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.seg];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
