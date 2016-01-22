//
//  ViewController.m
//  MyScrollView
//
//  Created by 白洋 on 16/1/22.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIScrollView * scrollview;
@property (nonatomic,strong) NSArray * dataSource;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@end

@implementation ViewController


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataSource.count;
}

//viewforRow方法可现实view在pickerview中
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//    UILabel * label = nil;
//    if (view == nil) {
//        label = [[UILabel alloc]initWithFrame:CGRectMake(2, 10, 200, 100)];
//        label.text = [self.dataSource objectAtIndex:row];
//    }else{
//        label = (UILabel*)view;
//    }
//    return label;
//}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.dataSource objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%@",[self.dataSource objectAtIndex:row]);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll....");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.jpg"]];
//   		 imgView.frame = self.view.frame;
//    [self.view addSubview:imgView];
    self.scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 20, self.view.frame.size.width-10, self.view.frame.size.height-300)];
    self.scrollview.contentSize = imgView.frame.size;
    self.scrollview.showsHorizontalScrollIndicator = YES;
    self.scrollview.showsVerticalScrollIndicator = YES;
    self.scrollview.delegate = self;
    [self.scrollview addSubview:imgView];
    [self.view addSubview:self.scrollview];
    
//    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(10, self.scrollview.frame.size.height+10, 300,400)];
//    self.pickerView.showsSelectionIndicator = YES;
//    [self.view addSubview:self.pickerView];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.dataSource = @[@"北京",@"上海",@"广州",@"武汉",@"哈尔滨"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
