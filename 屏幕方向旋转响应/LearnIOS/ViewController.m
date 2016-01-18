//
//  ViewController.m
//  LearnIOS
//
//  Created by 白洋 on 16/1/14.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)addNewImageView {
    // Do any additional setup after loading the view, typically from a nib.
    UIImage * img = [UIImage imageNamed:@"a"];
    imgView = [[UIImageView alloc] initWithImage:img];
    [self.view addSubview:imgView];
}

- (void)getSomeBasicDir {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>> dir:%@",documentDir);
    
    NSString * appDir = NSHomeDirectory();
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>> homedir:%@",appDir);
    
    NSString * apptempDir = NSTemporaryDirectory() ;
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>> tempDir:%@",apptempDir);
    
    NSString * resourceDir = [[NSBundle mainBundle] resourcePath];
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>> resourceDir:%@", resourceDir);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNewImageView];
    [self getSomeBasicDir];
    
    /*添加屏幕旋转的事件响应*/
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged) name:UIDeviceOrientationDidChangeNotification object:nil];
}
- (void)orientationChanged
{
    switch ([[UIDevice currentDevice] orientation])
    {
        case UIDeviceOrientationPortrait:
            
            NSLog(@">>>>>>>>>>>>>>>>>>UIDeviceOrientationPortrait");
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@">>>>>>>>>>>>>>>>>>UIDeviceOrientationPortraitUpsideDown");
            
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@">>>>>>>>>>>>>>>>>>UIDeviceOrientationLandscapeLeft");
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@">>>>>>>>>>>>>>>>>>UIDeviceOrientationLandscapeRight");
            break;
        case UIDeviceOrientationFaceDown:
            NSLog(@">>>>>>>>>>>>>>>>>>UIDeviceOrientationFaceDown");
            break;
        case UIDeviceOrientationFaceUp:
            NSLog(@">>>>>>>>>>>>>>>>>>UIdeviceOrientationFaceUp");
            break;
        case UIDeviceOrientationUnknown:
            break;
            
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
