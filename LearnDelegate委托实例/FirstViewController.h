//
//  OneViewController.h
//  LearnDelegate
//
//  Created by 白洋 on 16/1/15.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "secondViewControllerDelegate.h"

//第一个viewcontroller需要实现第二个viewcontroller的协议

@interface FirstViewController : UIViewController<secondViewControllerDelegate>

@end
