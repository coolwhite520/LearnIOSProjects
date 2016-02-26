//
//  ViewController.h
//  MyCoreLocation
//
//  Created by 白洋 on 16/2/26.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Place.h"


@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property(nonatomic,strong) CLLocationManager * locationManager;
@property(nonatomic,strong) CLLocation * prePoint;
@end

