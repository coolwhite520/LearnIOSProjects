//
//  Person.h
//  PredicateTest1
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject


@property(nonatomic,copy) NSString * name;
@property(assign) int age;

- (id)initWithName:(NSString*)name
           withAge:(int)age;
@end
