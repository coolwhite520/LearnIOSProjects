//
//  MyParseUtil.h
//  MyNSXMLParse
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"

@interface MyParseUtil : NSObject<NSXMLParserDelegate>

@property(nonatomic,strong) NSMutableArray * customersArray;

- (void)parseXML:(NSString*)filepath;
@end
