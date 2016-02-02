//
//  Customer.h
//  MyNSXMLParse
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject<NSCopying,NSMutableCopying>

@property(nonatomic,assign) NSInteger pid;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * phone;

- (instancetype)initWithName:(NSString*)name
                      withId:(NSInteger)pid
                   withPhone:(NSString*)phone;
@end
