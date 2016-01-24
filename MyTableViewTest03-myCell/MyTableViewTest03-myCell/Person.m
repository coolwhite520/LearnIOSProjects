//
//  Person.m
//  MyTableViewTest03-myCell
//
//  Created by 白洋 on 16/1/24.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithName:(NSString*)name
                    withSex:(NSString*)sex
                    withAge:(int)age

{
    self = [super init];
    if (self) {
        self.name = name;
        self.sex = sex;
        self.age = age;
    }
    return self;
}
@end
