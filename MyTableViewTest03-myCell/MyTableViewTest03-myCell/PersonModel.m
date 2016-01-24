//
//  PersonModel.m
//  MyTableViewTest03-myCell
//
//  Created by 白洋 on 16/1/24.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "PersonModel.h"


@implementation PersonModel

-(void)creatPersonList{
    self.personList = [NSMutableArray arrayWithCapacity:100];
    for (int i=0; i<100; i++) {
        Person * per = nil;
        if (i % 2 == 0) {
            per = [[Person alloc]initWithName:[NSString stringWithFormat:@"Man's name is:%d",i] withSex:@"male" withAge:20+i];
        }else{
            per = [[Person alloc]initWithName:[NSString stringWithFormat:@"Woman's name is:%d",i] withSex:@"female" withAge:20+i];
        }
        
        [self.personList insertObject:per atIndex:i];
    }
}
@end
