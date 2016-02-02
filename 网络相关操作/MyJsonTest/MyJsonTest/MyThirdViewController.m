//
//  MyThirdViewController.m
//  MyJsonTest
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "MyThirdViewController.h"

@interface MyThirdViewController ()

@property(nonatomic,strong) IBOutletCollection(UILabel) NSArray * array;
@end

@implementation MyThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详细信息";
//    self.navigationItem.title = @"";
    
    NSString * name = [_dic objectForKey:@"name"];
    NSString * pid = [_dic objectForKey:@"id"];
    NSString * phone = [_dic objectForKey:@"phone"];
    
    UILabel * nameLable = _array[0];
    UILabel * idLabel = _array[1];
    UILabel * phoneLable = _array[2];
    
    nameLable.text = name;
    idLabel.text = pid;
    phoneLable.text = phone;
    
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
