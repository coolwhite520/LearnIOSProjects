//
//  ViewController.m
//  TestUIActionSheet
//
//  Created by 白洋 on 16/1/20.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clickBtn:(id)sender{
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"我是actionsheet" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"destructive" otherButtonTitles:@"Ohter", nil];
    [actionSheet showInView:self.view];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 200, 30)];
    //btn.backgroundColor = [UIColor redColor];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:@"Click Me To Show ActionSheet" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString * strName = [actionSheet buttonTitleAtIndex:buttonIndex];
    NSLog(@"%@",strName);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
