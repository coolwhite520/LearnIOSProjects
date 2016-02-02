//
//  Customer.m
//  MyNSXMLParse
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Customer.h"

@implementation Customer


- (instancetype)initWithName:(NSString*)name
                      withId:(NSInteger)pid
                   withPhone:(NSString*)phone{
    
    self = [super init];
    if (self) {
        self.name = name;
        self.pid = pid;
        self.phone = phone;
    }
    return  self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    Customer * custom = [[[self class] allocWithZone:zone]init];
    custom.name = self.name;
    custom.pid = self.pid;
    custom.phone = self.phone;
    return custom;
}
- (id)mutableCopyWithZone:(nullable NSZone *)zone{
    
    Customer * custom = [[[self class] allocWithZone:zone]init];
    custom.name = self.name;
    custom.pid = self.pid;
    custom.phone = self.phone;
    return custom;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"name:%@ id:%lu phone:%@",_name,_pid,_phone];
}
@end
