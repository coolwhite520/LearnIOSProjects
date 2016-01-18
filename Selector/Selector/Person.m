//
//  Person.m
//  Selector
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)testAnimal:(Animal *)a{
    SEL s = @selector(Sleep);
    //SEL s = NSSelectorFromString(@"Sleep");
    [a performSelector:s];
}
@end
