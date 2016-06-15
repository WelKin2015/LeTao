//
//  AppDelegate+Location.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

//分类和继承的区别：官方：分类不能添加属性

#import "AppDelegate+Location.h"
//使用runtime让分类也可以添加属性
#import <objc/runtime.h>

@implementation AppDelegate (Location)

-(void)setLocationManager:(CLLocationManager *)locationManager {
    //@selector(locationManager) -> 本质就是个指针地址
    //绑定了指针地址和locationManager变量
    return objc_setAssociatedObject(self, @selector(locationManager), locationManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CLLocationManager *)locationManager {
    //_cmd 当前方法的指针
    return objc_getAssociatedObject(self, _cmd);
}


-(void)setupLocation {
    
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    //此方法只有iOS8以后才有
    //responseToSelector：返回值使BOOL值，YES就代表有某个方法
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    //开启定位服务：注意iOS8之后的特点
    [self.locationManager startUpdatingLocation];
    //设置初始城市
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (!kCurrentCity) {
            [[NSUserDefaults standardUserDefaults] setObject:@"北京" forKey:kCurrentCityName];
            [[NSUserDefaults standardUserDefaults] synchronize];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangeNotification object:nil];
            });
        }
    });
    
}

#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = locations.firstObject;
    if (location) {
        [manager stopUpdatingLocation];
        manager.delegate = nil;
        //反地理编码
        [[CLGeocoder new] reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            CLPlacemark *placeMark = placemarks.firstObject;
            NSString *localCity = placeMark.locality;
            NSLog(@"%@",localCity);
            localCity = [localCity stringByReplacingOccurrencesOfString:@"市" withString:@""];
            if (![kCurrentCity isEqualToString:localCity]) {
                //BlocksKit第三方优化
                NSString *message = [NSString stringWithFormat:@"当前城市已发生变化，是否切换到'%@'?",localCity];
                [UIAlertView bk_showAlertViewWithTitle:@"切换城市" message:message cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                    if (buttonIndex == 1) {
                        //1、保存新的城市名称到UserDefaults
                        //2、同步到沙盒
                        //3 、发送城市变更通知
                        [[NSUserDefaults standardUserDefaults] setObject:localCity forKey:kCurrentCityName];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangeNotification object:nil];
                    }
                }];
            }
        }];
    }
}

@end
