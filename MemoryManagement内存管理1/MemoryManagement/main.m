//
//  main.m
//  MemoryManagement
//
//  Created by 白洋 on 16/1/17.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

//本实例 主要讲解当工程不适用ARC的时候如何保证不内存泄漏的问题，Person需要重写super的dealloc方法，在方法中手动release掉Pet

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * p1 = [[Person alloc]init];
        NSLog(@"p1 retainCount = %ld",[p1 retainCount]);
        [p1 release];
    }
    return 0;
}
