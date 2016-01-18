//
//  Person.m
//  PropertyMemory
//
//  Created by 白洋 on 16/1/18.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "Person.h"

@implementation Person
//
//
//-(Pet*)pet{
//    return _pet;
//}
//-(void)setPet:(Pet*)myPet{
//    if (_pet != myPet) {
//        [_pet release];
//        _pet = [myPet retain];
//    }
//}
//
//-(void)setAge:(int)a{
//    _age = a;
//}
//-(int)age{
//    return _age;
//}
//
//-(NSString*)name{
//    return _name;
//}
//-(void)setName:(NSString*)newName{
//    if (_name != newName) {
//        [_name release];
//        _name = [newName copy];
//    }
//}
-(void)test{
    NSLog(@"name = %@,age = %d",_name,_age);
}

@end
