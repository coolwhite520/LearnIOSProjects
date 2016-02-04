//
//  MySecondViewController.m
//  MyJsonTest
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "MySecondViewController.h"
#import "MyThirdViewController.h"

@interface MySecondViewController ()

@property(nonatomic,strong) UITableView * table;
@property(nonatomic,strong) NSMutableArray * datasource;
@end

@implementation MySecondViewController

-(void)setDataSource:(NSMutableArray*)data{
    _datasource = data;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cid = @"cid";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cid];
    }
    
    NSDictionary * dic = [_datasource objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"name"];
    cell.detailTextLabel.text = [dic objectForKey:@"phone"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return indexPath;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary * dic = [_datasource objectAtIndex:indexPath.row];
    MyThirdViewController * thirdController = [self.storyboard instantiateViewControllerWithIdentifier:@"third_sid"];
    thirdController.dic = dic;
    [self.navigationController pushViewController:thirdController animated:YES];
    [thirdController setBlock:^(NSDictionary *d) {
        NSInteger index = indexPath.row;
        _datasource[index] = d;
        [_table reloadData];
        //[_datasource replaceObjectAtIndex:index withObject:d];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"用户列表";
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect rect = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20);
    _table = [[UITableView alloc]initWithFrame:rect];
    _table.dataSource = self;
    _table.delegate = self;
    
    
    [self.view addSubview:_table];
        self.view.backgroundColor = [UIColor greenColor];
    //self.navigationItem.title = @"";
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
