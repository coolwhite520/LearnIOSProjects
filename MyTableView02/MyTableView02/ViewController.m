//
//  ViewController.m
//  MyTableView02
//
//  Created by 白洋 on 16/1/23.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation ViewController


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * strID = @"ID";
    UITableViewCell * cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:strID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strID];
        
    }
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"this is detail info....";
    if (indexPath.row % 2 == 0) {
        cell.imageView.image = [UIImage imageNamed:@"3"];
    }else{
        cell.imageView.image = [UIImage imageNamed:@"2"];
    }
    
    return  cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[NSMutableArray alloc]initWithCapacity:10];
    for (int i=0; i<100; i++) {
        NSString * str = [NSString stringWithFormat:@"我是序号：%d",i];
        //[self.dataSource addObject:str];
        [self.dataSource insertObject:str atIndex:i];
    }
    
    NSLog(@"%@",self.dataSource);
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
