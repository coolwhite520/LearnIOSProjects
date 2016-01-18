//
//  main.m
//  SingleTon
//
//  Created by 白洋 on 16/1/16.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * per1 = [Person getInstance];
        Person * per2 = [[Person alloc]init];
        NSLog(@"per1 = %p\n per2 = %p",per1,per2);
    }
    return 0;
}
