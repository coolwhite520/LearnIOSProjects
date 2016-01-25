//
//  Model.m
//  MyTableViewTest04
//
//  Created by 白洋 on 16/1/25.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Model.h"

@implementation Model

-(instancetype)init{
    self = [super init];
    if (self) {
        _listMsg = [NSMutableArray arrayWithCapacity:10];
        for (int i=0; i<100; i++) {
            NSString * strMsg = [NSString stringWithFormat:@"留言－－%d",i];
            [_listMsg insertObject:strMsg atIndex:i];
        }
    }
    return self;
}
@end
