//
//  Person.m
//  SingleTon
//
//  Created by 白洋 on 16/1/16.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Person.h"

static Person * instance = nil;

@interface Person()
-(instancetype)init;
@end

@implementation Person

+(Person*)getInstance
{
    if (instance == nil) {
        instance = [[Person alloc]init];
    }
    return instance;
}
-(instancetype)init{
    return self;
}
@end
