//
//  ViewController.m
//  MyUINavigationBar
//
//  Created by 白洋 on 16/1/27.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"One";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, 90, 36 )];
    btn.backgroundColor = [UIColor redColor];
    btn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [btn setTitle:@"Go2" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(GO:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)GO:(id)sender{
    
    ViewController2 * viewCtller2 = [self.storyboard instantiateViewControllerWithIdentifier:@"storyboard_sid"];
    [self.navigationController pushViewController:viewCtller2 animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
