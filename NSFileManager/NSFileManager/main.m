//
//  main.m
//  NSFileManager
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager * filemanager = [NSFileManager defaultManager];
        NSArray * array = [filemanager URLsForDirectory:NSDesktopDirectory inDomains:NSUserDomainMask];
        NSLog(@"%@",array);
        
    }
    return 0;
}
