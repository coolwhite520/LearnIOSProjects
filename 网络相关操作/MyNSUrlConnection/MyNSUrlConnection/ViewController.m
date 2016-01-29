//
//  ViewController.m
//  MyNSUrlConnection
//
//  Created by 白洋 on 16/1/29.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)getUrlInfo:(id)sender{

    NSLog(@"get.....");
    NSURL * url = [NSURL URLWithString:@"http://192.168.188.111:8000"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSString * strData = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",strData);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn =[[ UIButton alloc]initWithFrame:CGRectMake(10, 100, 90, 80)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"Get" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(getUrlInfo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
