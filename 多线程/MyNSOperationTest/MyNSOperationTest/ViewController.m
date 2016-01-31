//
//  ViewController.m
//  MyNSOperationTest
//
//  Created by 白洋 on 16/1/31.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)DelayOperationX:(NSNumber*)time{
    
    int iTime = time.intValue;
    for (int i=0; i<iTime; i++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"X = %d",i);
    }
}

-(void)DelayOperationY:(NSNumber*)time{
    
    int iTime = time.intValue;
    for (int i=0; i<iTime; i++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Y = %d",i);
    }
}


- (IBAction)click:(UIButton *)sender {
    
    NSNumber * num = [NSNumber numberWithInt:5];
    NSInvocationOperation * o1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(DelayOperationX:) object:num];
    
    NSInvocationOperation * o2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(DelayOperationY:) object:num];

    NSOperationQueue * q = [[NSOperationQueue alloc]init];
    [q addOperation:o1];
    [o2 addDependency:o1];
    [q addOperation:o2];
}
- (IBAction)click2:(UIButton *)sender {
    
    NSBlockOperation * blockOperation1 = [ NSBlockOperation blockOperationWithBlock:^{
        [self DelayOperationX:[NSNumber numberWithInt:10]];
    }];
    
    NSBlockOperation * blockOperation2 = [ NSBlockOperation blockOperationWithBlock:^{
        [self DelayOperationY:[NSNumber numberWithInt:10]];
    }];

    NSOperationQueue * q =[[NSOperationQueue alloc]init];
    
    [q addOperation:blockOperation1];
    [blockOperation2 addDependency:blockOperation1];
    [q addOperation:blockOperation2];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
