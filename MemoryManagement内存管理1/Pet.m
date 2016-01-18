//
//  Pet.m
//  MemoryManagement
//
//  Created by 白洋 on 16/1/17.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Pet.h"

@implementation Pet
- (void)dealloc{
    NSLog(@"Pet dealloc....");
    [super dealloc];
}
@end
