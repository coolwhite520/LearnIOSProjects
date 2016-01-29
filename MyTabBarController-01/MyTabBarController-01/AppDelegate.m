//
//  AppDelegate.m
//  MyTabBarController-01
//
//  Created by 白洋 on 16/1/29.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MyViewController2.h"
#import "MyViewController3.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController * tabBarController = [[UITabBarController alloc]init];
    
    ViewController * view1 = [[ViewController alloc]init];
    UIImage * homeImg = [[UIImage imageNamed:@"2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    view1.tabBarItem.image = homeImg;

    MyViewController2 * view2 = [[ MyViewController2 alloc]init];
    UIImage * pandaImg = [[UIImage imageNamed:@"3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    view2.tabBarItem.image = pandaImg;
    
    MyViewController3 * view3 = [[MyViewController3 alloc]init];
    UIImage * bearImg = [[UIImage imageNamed:@"5"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    view3.tabBarItem.image = bearImg;
//    view3.tabBarItem.title = @"帅哥";
    
    tabBarController.viewControllers = @[view1,view2,view3];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
