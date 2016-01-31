//
//  ViewController.m
//  MyPinchGuesterTest
//
//  Created by 白洋 on 16/1/31.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer * rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotate:)];
    [self.view addGestureRecognizer:rotation];
    
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
//    [self.view addGestureRecognizer:tap];
}

//-(void)tap:(UITapGestureRecognizer*)param{
//    
//    if (param.state == UIGestureRecognizerStateEnded) {
//        
//        CGPoint point = [param locationInView:self.view];
//        self.myImg.center = point;
//    }
//}


//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    for (UITouch * t in touches) {
//        CGPoint p = [t locationInView:self.view];
//        if (CGRectContainsPoint(self.myImg.frame, p)) {
//             self.myImg.center = p;
//        }
//    }
//}

-(void)rotate:(UIRotationGestureRecognizer*)param{
    
    CGFloat rotation = param.rotation;
    self.myImg.transform = CGAffineTransformMakeRotation(rotation);
    
}

-(void)pinch:(UIPinchGestureRecognizer*)param{
    
    CGFloat scale = param.scale;
    self.myImg.transform = CGAffineTransformMakeScale(scale, scale);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
