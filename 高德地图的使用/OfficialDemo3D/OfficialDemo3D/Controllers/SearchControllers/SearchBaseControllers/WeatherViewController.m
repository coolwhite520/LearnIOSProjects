//
//  WeatherViewController.m
//  officialDemo2D
//
//  Created by PC on 15/8/21.
//  Copyright (c) 2015年 AutoNavi. All rights reserved.
//

#import "WeatherViewController.h"
#import "PureLayout.h"
#import "MAWeatherLiveView.h"
#import "MAWeatherForecastView.h"

#define kHeightRatio 0.42

@interface WeatherViewController()

@property (nonatomic, strong) MAWeatherLiveView *weatherLiveView;
@property (nonatomic, strong) MAWeatherForecastView *weatherForecastView;

@end


@implementation WeatherViewController


#pragma mark - AMapSearchDelegate

- (void)onWeatherSearchDone:(AMapWeatherSearchRequest *)request response:(AMapWeatherSearchResponse *)response
{
    if (request.type == AMapWeatherTypeLive)
    {
        if (response.lives.count == 0)
        {
            return;
        }
        
        AMapLocalWeatherLive *liveWeather = [response.lives firstObject];
        if (liveWeather != nil)
        {
            [self.weatherLiveView updateWeatherWithInfo:liveWeather];
        }
    }
    else
    {
        if (response.forecasts.count == 0)
        {
            return;
        }
        
        AMapLocalWeatherForecast *forecast = [response.forecasts firstObject];
        
        if (forecast != nil)
        {
            [self.weatherForecastView updateWeatherWithInfo:forecast];
        }
    }
}

#pragma mark - Utility

- (void)searchLiveWeather
{
    AMapWeatherSearchRequest *request = [[AMapWeatherSearchRequest alloc] init];
    request.city                      = @"北京";
    request.type                      = AMapWeatherTypeLive;

    [self.search AMapWeatherSearch:request];
}

- (void)searchForecastWeather
{
    AMapWeatherSearchRequest *request = [[AMapWeatherSearchRequest alloc] init];
    request.city                      = @"北京";
    request.type                      = AMapWeatherTypeForecast;

    [self.search AMapWeatherSearch:request];
}

#pragma mark - Initialization

- (void)initWeatherLiveView
{
    self.weatherLiveView = [[MAWeatherLiveView alloc] init];
    [self.weatherLiveView setBackgroundColor:[UIColor colorWithRed:84/255.0 green:142/255.0 blue:212/255.0 alpha:1]];
    [self.view addSubview:self.weatherLiveView];
    
    [self.weatherLiveView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.weatherLiveView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.weatherLiveView autoPinEdgeToSuperviewEdge:ALEdgeRight];
}

- (void)initWeatherForecastView
{
    self.weatherForecastView = [[MAWeatherForecastView alloc] init];
    [self.weatherForecastView setBackgroundColor:[UIColor colorWithRed:84/255.0 green:142/255.0 blue:212/255.0 alpha:1]];
    [self.view addSubview:self.weatherForecastView];
    
    [self.weatherForecastView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.weatherForecastView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.weatherForecastView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.weatherForecastView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.weatherLiveView withOffset:5.0];
    [self.weatherForecastView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.weatherLiveView withMultiplier:kHeightRatio];
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initWeatherLiveView];
    [self initWeatherForecastView];
    
    [self searchLiveWeather];
    [self searchForecastWeather];
    
    self.mapView.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.mapView.hidden = NO;
}

@end
