//
//  ViewController.m
//  MyJsonTest
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"
#import "MySecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)parseJson:(UIButton *)sender {
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"customers" ofType:@"json"];
    NSData * data = [[NSData alloc]initWithContentsOfFile:filePath];
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",dic);
    NSArray * customers = [dic objectForKey:@"customers"];
    for (NSDictionary * d in customers) {
        NSLog(@"%@",d);
    }
    
    MySecondViewController * secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"second_sid"];
    self.delegate = secondViewController;
    
    if ([self.delegate respondsToSelector:@selector(setDataSource:)]) {
        
        [self.delegate setDataSource:customers];
    }
    [self.navigationController pushViewController:secondViewController animated:YES];
//    self.navigationItem.title = @"";
    //[self presentViewController:secondViewController animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor redColor];
      
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
