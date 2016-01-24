//
//  Person.m
//  MyNSCopying
//
//  Created by 白洋 on 16/1/24.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Person.h"

@implementation Person
- (id)copyWithZone:(NSZone *)zone{
    
    return [[Person allocWithZone:zone]init];
}
- (id)mutableCopyWithZone:(NSZone *)zone{
    
    return [[Person allocWithZone:zone]init];
}
- (NSString *)description{
    return self.name;
}
@end
