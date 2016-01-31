//
//  ViewController.m
//  UISwip_Pan_LongPress_Guester
//
//  Created by 白洋 on 16/1/31.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImgView;

@property (weak, nonatomic) IBOutlet UIPageControl *myPageView;

@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (nonatomic,strong) NSMutableArray * imgArray;
@end


static NSInteger g_index = 0;

@implementation ViewController

-(void)swipe:(UISwipeGestureRecognizer*)sender{
    
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            if (g_index != self.imgArray.count - 1) {
                g_index++;
            }
            break;
        case UISwipeGestureRecognizerDirectionRight:
            if (g_index != 0) {
                g_index--;
            }
            break;
        default:
            break;
    }
    
    self.myImgView.image = [UIImage imageNamed:[self.imgArray objectAtIndex:g_index]];
    self.myPageView.currentPage = g_index;
}

//-(void)pan:(UIPanGestureRecognizer*)sender{
//
//    CGPoint p = [sender locationInView:self.view];
//    if (CGRectContainsPoint(self.myBtn.frame, p)) {
//        self.myBtn.center = p;
//    }
//}

-(void)alertTips{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"您长按了,但是这个功能与滑动有冲突，屏蔽掉了" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"懂了" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:^(){
        [self.myBtn setTitle:@"仅仅可以长按" forState:UIControlStateNormal];
    }];
}

- (void)longPress:(UILongPressGestureRecognizer*)sender{
    
    CGPoint p = [sender locationInView:self.view];
    if (CGRectContainsPoint(self.myBtn.frame, p)) {
        self.myBtn.backgroundColor = [UIColor redColor];
        
        //[self performSelector:@selector(alertTips) withObject:nil afterDelay:0.0];
        [self alertTips];
    }
    else
        self.myBtn.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imgArray = [NSMutableArray arrayWithObjects:@"1.jpg", @"2",@"3",@"4",nil];
    
    UISwipeGestureRecognizer * swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer * swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    //拖动手势
    // UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    //[self.view addGestureRecognizer:pan];
    
    //    长按
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    [self.view addGestureRecognizer:longPress];
    
    self.myPageView.numberOfPages = self.imgArray.count;
    self.myPageView.currentPage = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
