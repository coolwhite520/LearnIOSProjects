//
//  PersonModel.h
//  MyTableViewTest03-myCell
//
//  Created by 白洋 on 16/1/24.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonModel : NSObject
@property (nonatomic,strong) NSMutableArray * personList;
- (void)creatPersonList;
@end
