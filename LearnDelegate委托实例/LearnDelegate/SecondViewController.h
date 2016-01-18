//
//  SecondViewController.h
//  LearnDelegate
//
//  Created by 白洋 on 16/1/15.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "secondViewControllerDelegate.h"
@interface SecondViewController : UIViewController

- (void)btnSwitchToFirstView:(UIButton*) btn;

//因为要从第二个view向第一个view传值，所以第二个viewcontroller相当于是“委托人”，他要让第一个view设置背景颜色，所以第一个view相当于“代理人”
@property (nonatomic,assign) id<secondViewControllerDelegate> delegate;

@end
