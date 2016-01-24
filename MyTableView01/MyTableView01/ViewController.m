//
//  ViewController.m
//  MyTableView01
//
//  Created by 白洋 on 16/1/23.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSArray * dataSource;
@end

@implementation ViewController


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * strID = @"ha";
    UITableViewCell * cell = nil;
    //not repeate to create the cell
    cell = [tableView dequeueReusableCellWithIdentifier:strID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
        cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    }
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = @[@"北京",@"上海",@"武汉",@"山东",@"北京",@"上海",@"武汉",@"山东",@"北京",@"上海",@"武汉",@"山东",@"北京",@"上海",@"武汉",@"山东",@"北京",@"上海",@"武汉",@"山东",@"北京",@"上海",@"武汉",@"山东",@"北京",@"上海",@"武汉",@"山东",@"北京",@"上海",@"武汉",@"山东"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
