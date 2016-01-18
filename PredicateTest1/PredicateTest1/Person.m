//
//  Person.m
//  PredicateTest1
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Person.h"

@implementation Person
- (NSString *)description{
    return  [NSString stringWithFormat:@"name = %@ ,age = %d",self.name,self.age];
}

- (id)initWithName:(NSString*)name
           withAge:(int)age{
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
        return self;
    }
    return nil;
}
@end
