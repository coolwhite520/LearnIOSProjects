//
//  ViewController.m
//  MyCoreLocation
//
//  Created by 白洋 on 16/2/26.
//  Copyright © 2016年 白洋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *longtitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation * newLocation = [locations lastObject];
    NSString * latitudeString= [NSString stringWithFormat:@"%g\u00b0",newLocation.coordinate.latitude];
    NSString * longtitudeString= [NSString stringWithFormat:@"%g\u00b0",newLocation.coordinate.longitude];
    _latitudeLabel.text = latitudeString;
    _longtitudeLabel.text = longtitudeString;
    
    if (self.prePoint == nil) {
        Place * start = [[Place alloc]init];
        start.coordinate = newLocation.coordinate;
        start.title = @"start point";
        start.subtitle = @"This is subtitle";
        [self.mapView addAnnotation:start];
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 100, 100);
        [_mapView setRegion:region animated:YES];
    }
    self.prePoint = newLocation;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_2){
    
    NSLog(@"Authorization status changed to %d",status);
    switch(status)
    {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [_locationManager startUpdatingLocation];
            _mapView.showsUserLocation = YES;
            break;
            
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
            [_locationManager stopUpdatingLocation];
            _mapView.showsUserLocation = NO;
            break;
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager requestWhenInUseAuthorization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
