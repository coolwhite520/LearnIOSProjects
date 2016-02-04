//
//  MyThirdViewController.h
//  MyJsonTest
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MySecondViewController.h"

typedef void (^Thirdblock) (NSDictionary * d);

@interface MyThirdViewController : UIViewController

@property(nonatomic,strong) NSDictionary * dic;
@property(nonatomic,copy)Thirdblock block;
- (void)setBlock:(Thirdblock)block;
@end
