//
//  ViewController.m
//  MyTableViewTest04
//
//  Created by 白洋 on 16/1/25.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
@property (nonatomic,strong)NSMutableArray * dataSource;
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation ViewController



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cid = @"cid";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
    }
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    cell.detailTextLabel.text =[_dataSource objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:30];
    
    if (indexPath.row % 2 == 0) {
        cell.contentView.backgroundColor = [UIColor grayColor];
    }else{
        cell.contentView.backgroundColor = [UIColor greenColor];
    }
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    return  cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    NSString * strtip = [_dataSource objectAtIndex:indexPath.row];
    NSString * strMsg = [NSString stringWithFormat:@"You selected %@",strtip];
    UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"详细信息" message:strMsg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"yes,i do." style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)addRecord{
    [_dataSource insertObject:@"最新记录－－－－" atIndex:0];
    [self.tableView reloadData];
}

- (void)delRecord{

    [_tableView setEditing:!_tableView.editing animated:YES];
}

//删除某行的时候的代理相应
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"commit.....");
    [_dataSource removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}
//根据indexpath设定不同行的高度值
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row % 2 != 0) {
        return 90;
    }
    return _tableView.rowHeight;
}

//设定哪些行可以被选中，哪些行不能被选中
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    偶数行不进行选择
    if (indexPath.row % 2 == 0) {
        return nil;
    }
    return indexPath;
    
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray * mutableIndexArray = [NSMutableArray arrayWithCapacity:10];
    for (NSString * str in _dataSource) {
        [mutableIndexArray addObject:str];
    }
    return mutableIndexArray;
}
//选定后弹出消息内容提示
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * strtip = [_dataSource objectAtIndex:indexPath.row];
    NSString * strMsg = [NSString stringWithFormat:@"You selected %@",strtip];
    
    
    UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"Row Selected." message:strMsg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"yes,i do." style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIToolbar * toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(10, 20, self.view.frame.size.width - 10, 40)];
    [self.view addSubview:toolBar];
    
    UIBarButtonItem * barAdd = [[UIBarButtonItem alloc]initWithTitle:@"Add one record" style:UIBarButtonItemStylePlain target:self action:@selector(addRecord)];
    
    UIBarButtonItem * barSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * barDel = [[UIBarButtonItem alloc]initWithTitle:@"Del one record" style:UIBarButtonItemStylePlain target:self action:@selector(delRecord)];
    
    toolBar.items = @[barAdd,barSpace,barDel];
    
    
    _dataSource = [[Model alloc]init].listMsg;
    CGRect tableViewFrame = CGRectMake(10, 60, self.view.frame.size.width - 10, self.view.frame.size.height -60);
    _tableView = [[UITableView alloc]initWithFrame:tableViewFrame];
    [self.view addSubview:_tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
