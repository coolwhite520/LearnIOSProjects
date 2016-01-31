//
//  ViewController.m
//  MyAsiHttpRequestTest
//
//  Created by 白洋 on 16/1/31.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)grabURL:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
        NSLog(@"%@",response);
    }
}

- (IBAction)grabURLInBackground:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSString *responseString = [request responseString];
    NSLog(@"%@",responseString);
    // Use when fetching binary data
    NSData *responseData = [request responseData];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
}

//使用block
//- (IBAction)grabURLInBackground:(id)sender
//{
//    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
//    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setCompletionBlock:^{
//        // Use when fetching text data
//        NSString *responseString = [request responseString];
//        
//        // Use when fetching binary data
//        NSData *responseData = [request responseData];
//    }];
//    [request setFailedBlock:^{
//        NSError *error = [request error];
//    }];
//    [request startAsynchronous];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
