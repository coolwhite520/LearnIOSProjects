//
//  main.m
//  Selector
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// 1.当上下文中可以找到函数的时候可以直接使用 @selector()
// 2.当找不到的时候可以使用

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * p = [[Person alloc]init];
        
        Dog * d = [[Dog alloc]init];
        Cat * c = [[Cat alloc]init];
        
        [p testAnimal:d];
        [p testAnimal:c];
        
    }
    return 0;
}
