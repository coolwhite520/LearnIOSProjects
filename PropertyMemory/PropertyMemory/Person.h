//
//  Person.h
//  PropertyMemory
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"
@interface Person : NSObject
{

//    Pet * _pet;
//    int _age;
//    NSString * _name;
    
}


//-(Pet*)pet;
//-(void)setPet:(Pet*)myPet;
//
//-(void)setAge:(int)a;
//-(int)age;
//
//-(NSString*)name;
//-(void)setName:(NSString*)newName;

//上面的get 和set 方法相当于如下的属性

@property (nonatomic,strong) Pet * pet;
@property (nonatomic,assign) int age;
@property (nonatomic,copy) NSString* name;

-(void)test;
@end
