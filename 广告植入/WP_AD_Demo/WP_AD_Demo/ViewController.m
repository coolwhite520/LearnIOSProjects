//
//  ViewController.m
//  WP_AD_Demo
//
//  Created by 白洋 on 16/2/22.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,assign) Boolean bConnect;
@end

@implementation ViewController


- (IBAction)showlist:(UIButton *)sender {
    
    if (_bConnect) {
        [JOYConnect showList:self];
    }
}
- (IBAction)shwoban:(UIButton *)sender {
    
    if (_bConnect) {
        [JOYConnect showBan:self adSize:E_SIZE_414x70 showX:0 showY:20];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [JOYConnect sharedJOYConnect].delegate = self;
    [JOYConnect getConnect:@"c095b0ae47ec8bcda7760ae4c0486ad6" pid:@"appstore" userID:@"baiyang"];
    //[JOYConnect showList:self];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)onConnectSuccess{
    
    _bConnect = true;
    NSLog(@"connect succcess...");
}

- (void)onConnectFailed:(NSString *)error{
    
    _bConnect = false;
    NSLog(@"connect failed...%@",error);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
