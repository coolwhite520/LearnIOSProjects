//
//  Place.h
//  MyCoreLocation
//
//  Created by 白洋 on 16/2/26.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Place : NSObject<MKAnnotation>

@property(nonatomic,copy) NSString * title;
@property(nonatomic,copy) NSString * subtitle;
@property(assign,nonatomic) CLLocationCoordinate2D coordinate;

@end
