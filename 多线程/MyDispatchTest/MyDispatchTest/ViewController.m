//
//  ViewController.m
//  MyDispatchTest
//
//  Created by 白洋 on 16/1/31.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@end

@implementation ViewController

-(void)DispathProgress{
    
    float f = 0;
    for (int i=0; i<100; i++) {
        f += 0.01;
        [NSThread sleepForTimeInterval:0.1];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progress.progress = f;
        });
    }
}

- (IBAction)click:(UIButton *)sender {
    
    dispatch_queue_t d = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(d, ^{
        [self DispathProgress];
    });
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
