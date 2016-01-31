//
//  ViewController.m
//  MyNSThreadTest
//
//  Created by 白洋 on 16/1/31.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static NSThread * g_thread = nil;

@implementation ViewController


-(void)DelayOperation{
    
    for (int i = 0 ; i<10; i++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"i = %d",i);
    }
}

-(IBAction)click:(UIButton*)sender{
    
  
    if (g_thread == nil) {
        g_thread = [[NSThread alloc]initWithTarget:self selector:@selector(DelayOperation) object:nil];
        [g_thread start];
    }
    else{
        if (g_thread.isExecuting)
            return;
        else{
            g_thread = [[NSThread alloc]initWithTarget:self selector:@selector(DelayOperation) object:nil];
            [g_thread start];
        }
    }
    if ([[sender titleColorForState:UIControlStateNormal] isEqual:[UIColor redColor]]) {
         [sender setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }
    else{
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
   
    NSLog(@"click...end");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 50)];
    [btn setTitle:@"Create One Thread" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
