//
//  main.m
//  PropertyMemory
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// 上来先关闭了自动引用计数ARC的功能
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * p1 = [[Person alloc]init];
        [p1 setName:@"baiyang"];
        p1.age = 27;
        [p1 test];
    }
    return 0;
}
