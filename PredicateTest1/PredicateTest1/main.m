//
//  main.m
//  PredicateTest1
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray * mArray = [[NSMutableArray alloc]initWithCapacity:1000];
        for (int i; i<500; i++) {
            Person * p = [[Person alloc]initWithName:@"xiaobai" withAge:18];
            [mArray addObject:p];
        }
        for (int i; i<500; i++) {
            Person * p = [[Person alloc]initWithName:@"xiaoHei" withAge:19];
            [mArray addObject:p];
        }
        for (int i; i<500; i++) {
            Person * p = [[Person alloc]initWithName:@"xiaoLi" withAge:20];
            [mArray addObject:p];
        }
        for (int i; i<500; i++) {
            Person * p = [[Person alloc]initWithName:@"xiaoZhang" withAge:21];
            [mArray addObject:p];
        }
        NSLog(@"MutableArray = %@",mArray);
//        1.设定过滤条件，这种效率要比for高
        NSPredicate * predicate = [NSPredicate predicateWithFormat:@"age == 21"];
//        2.执行过滤的方法，自动返回一个数组
        NSArray * arrayAgeEqual21 = [mArray filteredArrayUsingPredicate:predicate];
        NSLog(@"arrayAgeEqual21 = %@",arrayAgeEqual21);
    }
    return 0;
}
