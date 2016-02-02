//
//  ViewController.h
//  MyJsonTest
//
//  Created by 白洋 on 16/2/2.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SendData <NSObject>

@required
-(void)setDataSource:(NSArray*)data;

@end

@interface ViewController : UIViewController
@property (nonatomic,strong) id<SendData> delegate;
@end

