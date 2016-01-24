//
//  main.m
//  MyNSCopying
//
//  Created by 白洋 on 16/1/24.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * p1 = [[Person alloc]init];
        p1.name = @"bai";
        
        Person * p2 = [p1 copy];
        p2.name = @"yang";
        
        NSLog(@"p1=%@ p2=%@ p1=%p p2=%p",p1,p2,p1,p2);
    }
    return 0;
}
