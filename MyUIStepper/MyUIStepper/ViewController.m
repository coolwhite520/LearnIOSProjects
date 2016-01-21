//
//  ViewController.m
//  MyUIStepper
//
//  Created by 白洋 on 16/1/21.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIStepper * stepper;
@property (nonatomic,strong) UISlider * slider;
@property (nonatomic,strong) UIPageControl * pageCtrl;
@end


@implementation ViewController

- (IBAction)valueChangedStepper:(UIStepper*)sender{
    NSLog(@"value=%f",sender.value);
    [self.slider setValue:sender.value animated:YES];
    self.pageCtrl.currentPage = sender.value/10;
}

- (IBAction)valueChangedSlider:(UISlider*)sender{
    NSLog(@"value=%f",sender.value);
    [self.stepper setValue:sender.value];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //    create stepper control
    self.stepper = [[UIStepper alloc]initWithFrame:CGRectMake(10, 200, [[UIScreen mainScreen] bounds].size.width,40)];
    self.stepper.center  = CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2);
    [self.view addSubview:self.stepper];
    self.stepper.minimumValue = 0;
    self.stepper.maximumValue = 100;
    self.stepper.stepValue = 10;
    [self.stepper addTarget:self action:@selector(valueChangedStepper:) forControlEvents:UIControlEventValueChanged];
    
    //    create slider control
    self.slider = [[UISlider alloc]initWithFrame:CGRectMake(100, 300, 200, 20)];
    [self.view addSubview:self.slider];
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 100;
    [self.slider addTarget:self action:@selector(valueChangedSlider:) forControlEvents:UIControlEventValueChanged];
   
    //    create PageControl
    
    self.pageCtrl = [[UIPageControl alloc]initWithFrame:CGRectMake(100, 400, 200, 20)];
    self.pageCtrl.numberOfPages = 11;
    self.pageCtrl.pageIndicatorTintColor = [UIColor greenColor];
    self.pageCtrl.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:self.pageCtrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
