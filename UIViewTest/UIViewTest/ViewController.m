//
//  ViewController.m
//  UIViewTest
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIView * redView;
@property (nonatomic,strong) UIView * blueView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redView = [[UIView alloc]initWithFrame:CGRectMake(30, 30, 200, 200)];
    self.redView.backgroundColor = [UIColor redColor];
    
    self.blueView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    self.blueView.backgroundColor = [UIColor blueColor];
    

    [self.redView addSubview:self.blueView];
    [self.view addSubview:self.redView];
    
//    self.view addGestureRecognizer:<#(nonnull UIGestureRecognizer *)#>
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch* t in touches) {
        CGPoint p = [t locationInView:self.view];
        self.redView.center = p;
        self.redView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch* t in touches) {
        self.redView.center = [t locationInView:self.view];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
