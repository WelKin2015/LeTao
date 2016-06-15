//
//  AppDelegate+Location.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "AppDelegate.h"
//@import Xcode7之后的新特性, 好处就是不需要到Build Phaze里面去引入类库了
@import CoreLocation;

@interface AppDelegate (Location) <CLLocationManagerDelegate>

/** 定位*/
@property (nonatomic,strong) CLLocationManager *locationManager;

-(void)setupLocation ;

@end
