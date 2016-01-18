//
//  main.m
//  Block_1
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        1
        void (^BlockPrint)(void) = ^(void){
            NSLog(@"Hello,Block");
        };
        BlockPrint();
//        2
        int (^BlockAdd)(int a,int b) = ^(int a,int b){
            return a + b;
        };
        int sum = BlockAdd(100,50);
        NSLog(@"Sum = %d",sum);
//        3
        __block int num1 = 100;
        void (^BlockModify)(void) = ^(void){
            num1 = 200;
        };
        BlockModify();
        NSLog(@"num1 = %d",num1);
//        4
        NSArray * array = [[NSArray alloc]initWithObjects:@"1",@"5",@"2", nil];
        array = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        NSLog(@"array = %@",array);
//        5
        typedef void (^BlockPrint2) (void);
        BlockPrint2 print2 = ^(void){
            NSLog(@"hello,print2");
        };
        print2();
//        6
        static int a = 10, b = 11;
        int (^BlockAddTwo)() = ^(){
            return a + b;
        };
        NSLog(@"a + b = %d",BlockAddTwo());
        a = 11;
        b = 12;
        NSLog(@"a + b = %d",BlockAddTwo());
        
    }
    return 0;
}
