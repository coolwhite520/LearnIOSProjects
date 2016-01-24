//
//  Person.h
//  MyNSCopying
//
//  Created by 白洋 on 16/1/24.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying,NSMutableCopying>
@property (nonatomic,copy) NSString * name;
@end
