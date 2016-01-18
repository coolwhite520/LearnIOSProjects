//
//  ViewController.m
//  CloseVirtualKeyboard
//
//  Created by 白洋 on 16/1/15.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController




//添加单击的手势监控事件
//- (void)addGestureRecognizer {
//    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnDown:)];
//    [self.view addGestureRecognizer:tapGestureRecognizer];
//    tapGestureRecognizer.delegate = self;
//    tapGestureRecognizer.cancelsTouchesInView = NO;
//}
//- (void)btnDown:(UITapGestureRecognizer *)sender
//{
//    NSLog(@"btndown");
//}
	

- (void)didAndOnExit:(id) sender{
    //   第一响应者就是当前的textfield ，给sender 发送一个消息，来放弃第一响应者。
    [sender resignFirstResponder];
    
}

//点击背景的时候调用这个函数，需要将view视图的customclass 设置为UIControl 因为它里面有鼠标按下的消息
- (IBAction)backgroundTap:(id)sender{
    [[self.view viewWithTag:1] resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, [[UIScreen mainScreen] bounds].size.width - 10, 30)];
    [textField setTag:1];
    textField.layer.borderColor = [UIColor blackColor].CGColor;
    textField.layer.borderWidth = 1;
    [textField addTarget:self action:@selector(didAndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:textField];
    
//    [self addGestureRecognizer];

}

@end
