//
//  Person.h
//  MyTableViewTest03-myCell
//
//  Created by 白洋 on 16/1/24.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * sex;
@property (nonatomic,assign) int age;

-(instancetype)initWithName:(NSString*)name
                    withSex:(NSString*)sex
                    withAge:(int)age;
@end
