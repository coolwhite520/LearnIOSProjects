//
//  ViewController.m
//  MyNSXMLParse
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"
#import "MyParseUtil.h"
#import "GDataXML/GDataXMLNode.h"

@interface ViewController ()

@end

@implementation ViewController



#pragma mark - "NSXML解析xml按钮事件响应"
- (IBAction)parseUseNSXMLParse:(UIButton *)sender {
    
    NSBundle * bundle = [NSBundle mainBundle];
    NSString * path = [bundle pathForResource:@"Customers" ofType:@"xml"];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        MyParseUtil * util = [[MyParseUtil alloc]init];
        [util parseXML:path];
        
        for (Customer * c in util.customersArray) {
            NSLog(@"%@",c);
        }
       
    }
    else{
        NSLog(@"%@ file is not exists.",path);
    }
 
}
#pragma mark - "使用谷歌开源代码解析xml"
- (IBAction)paseUseGDataXML:(UIButton *)sender {
    
    NSBundle * bundle = [NSBundle mainBundle];
    NSString * path = [bundle pathForResource:@"Customers" ofType:@"xml"];
    NSData * data = [NSData dataWithContentsOfFile:path];
    GDataXMLDocument * doc = [[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
    
    NSArray * array = [doc.rootElement elementsForName:@"customer"];
    
    for (GDataXMLElement* element in array) {
        
        Customer * customer = [[Customer alloc]init];
        NSString * name = [[[element elementsForName:@"name"] objectAtIndex:0] stringValue];
        NSString * phone =[[[element elementsForName:@"phone"] objectAtIndex:0] stringValue];
        NSInteger pid = [[[[element elementsForName:@"id"] objectAtIndex:0] stringValue] integerValue];
        customer.name = name;
        customer.pid = pid;
        customer.phone = phone;
        NSLog(@"%@",customer);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
