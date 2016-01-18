//
//  Person.m
//  MemoryManagement
//
//  Created by 白洋 on 16/1/17.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)init{
    self = [super init];
    if (self) {
        _pet = [[Pet alloc]init];
        return self;
    }
    return  nil;
}
- (void)dealloc{
    [_pet release]; //先清理自己的成员
    [super dealloc];
    NSLog(@"Person dealloc....");
}
@end
