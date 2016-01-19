//
//  SecondViewController.h
//  SendValueToViewController2
//
//  Created by 白洋 on 16/1/19.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SendTextBlock)(NSString * strText);
@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic,copy) SendTextBlock sendBlock;

- (void)setBlock:(SendTextBlock) block;
@end
