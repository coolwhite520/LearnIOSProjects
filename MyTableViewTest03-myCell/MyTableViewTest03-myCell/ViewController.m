//
//  ViewController.m
//  MyTableViewTest03-myCell
//
//  Created by 白洋 on 16/1/24.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "PersonModel.h"
#import "PersonTableViewCell.h"

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
    
    static NSString * cid = @"cid";
    PersonTableViewCell * cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[PersonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }
    
    Person * per = [self.dataSource objectAtIndex:indexPath.row];
    cell.nameLabel.text = per.name;
    cell.ageLabel.text = [NSString stringWithFormat:@"%d",per.age];
    cell.sexLabel.text = per.sex;
    if ([per.sex  isEqual: @"female"]) {
        cell.imgView.image = [UIImage imageNamed:@"girl"];
    }else{
        cell.imgView.image = [UIImage imageNamed:@"boy"];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    PersonModel * model = [[PersonModel alloc]init];
    [model creatPersonList];
    self.dataSource = model.personList;
    
    for (Person*per in self.dataSource) {
        NSLog(@"name=%@ sex=%@ age=%d",per.name,per.sex,per.age);
    }
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
