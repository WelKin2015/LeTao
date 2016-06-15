
//  AppDelegate.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/2.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "AppDelegate.h"
#import "VideoListModel.h"
#import "HomeListModel.h"
#import "CategoriesModel.h"
#import "CitiesModel.h"
#import "DPNetManager.h"

//@import:Xcode7只会的新特性，好处使不需要到BulidPhaze中引入类库了。但是只针对系统类库
//@import CoreLocation;

@interface AppDelegate () //<CLLocationManagerDelegate>
/** 定位*/
//@property (nonatomic,strong) CLLocationManager *locationManager;
@end

@implementation AppDelegate

#pragma mark - LazyLoad
//-(CLLocationManager *)locationManager {
//    if (!_locationManager) {
//        _locationManager = [CLLocationManager new];
//        _locationManager.delegate = self;
//        //此方法只有iOS8以后才有
//        //responseToSelector：返回值使BOOL值，YES就代表有某个方法
//        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
//            [_locationManager requestWhenInUseAuthorization];
//        }
//    }
//    return _locationManager;
//}

//#pragma mark - CLLocationManagerDelegate
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    CLLocation *location = locations.firstObject;
//    if (location) {
//        [manager stopUpdatingLocation];
//        manager.delegate = nil;
//        //反地理编码
//        [[CLGeocoder new] reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//            CLPlacemark *placeMark = placemarks.firstObject;
//            NSString *localCity = placeMark.locality;
//            NSLog(@"%@",localCity);
//            localCity = [localCity stringByReplacingOccurrencesOfString:@"市" withString:@""];
//            if (![kCurrentCity isEqualToString:localCity]) {
//                //BlocksKit第三方优化
//                NSString *message = [NSString stringWithFormat:@"当前城市已发生变化，是否切换到'%@'?",localCity];
//                [UIAlertView bk_showAlertViewWithTitle:@"切换城市" message:message cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
//                    if (buttonIndex == 1) {
//                        //1、保存新的城市名称到UserDefaults
//                        //2、同步到沙盒
//                        //3 、发送城市变更通知
//                        [[NSUserDefaults standardUserDefaults] setObject:localCity forKey:kCurrentCityName];
//                        [[NSUserDefaults standardUserDefaults] synchronize];
//                        [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangeNotification object:nil];
//                    }
//                }];
//            }
//        }];
//    }
//}

#pragma mark - 生命周期
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //调用UI统一配置方法
    [self configGlobalUI];
    
    //调用分类中的定位相关方法
    [self setupLocation];
    
    //测试DPNetManager
//    [DPNetManager getBusinessesWithCategory:@"美食" page:1 completionHandler:^(BusinessModel *model, NSError *error) {
//        NSLog(@"%@",model);
//    }];
    
//    //开启定位服务：注意iOS8之后的特点
//    [self.locationManager startUpdatingLocation];
//    //设置初始城市
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        if (!kCurrentCity) {
//            [[NSUserDefaults standardUserDefaults] setObject:@"北京" forKey:kCurrentCityName];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangeNotification object:nil];
//            });
//        }
//    });

    return YES;
}

//对UI进行统一配置
-(void)configGlobalUI {
    //目的：改变tabbar字体渲染颜色
    //注意：下面方法RGB参数不是0~255，而是0~1，因此需要除以255
    self.window.tintColor =kRGBColor(227, 59, 65, 1.0);
    //设置导航栏的背景色及风格
    [[UINavigationBar appearance] setBarTintColor:kRGBColor(233, 82, 84, 1.0)];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];
    [UIBarButtonItem appearance].tintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]}];
    
}



@end




/**
 *  数据解析内容
 */
 //http://c.m.163.com/nc/video/home/1-10.html
 //http://www.quanmin.tv/json/play/list.json
 //http://www.quanmin.tv/json/page/ad-slot/info.json
 //搜索团购http://api.dianping.com/v1/deal/find_deals?appkey=4123794720&sign=7DA792DF7A5203CA2C08C0DFEE1338325E7CD99E&city=%E6%9D%AD%E5%B7%9E&region=%E8%A5%BF%E6%B9%96%E5%8C%BA&category=%E7%BE%8E%E9%A3%9F&limit=3&page=1
 //搜索商家http://api.dianping.com/v1/business/find_businesses?appkey=4123794720&sign=D9770C7E1B3FD5C111B932A48EF3F67A65094A5A&category=%E7%BE%8E%E9%A3%9F&city=%E6%9D%AD%E5%B7%9E&latitude=30.2800590000&longitude=120.1616930000&sort=1&limit=20&offset_type=1&out_offset_type=1&platform=2
 //NSString *path = @"http://c.m.163.com/nc/video/home/1-10.html";
 //NSString *path = @"http://www.quanmin.tv/json/play/list.json";
 /*
 AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
 [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
 NSLog(@"%@",responseObject);
 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
 NSLog(@"%@",error);
 }];
 
 [NSObject GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
 //VideoListModel *model = [VideoListModel modelWithJSON:responseObj];
 HomeListModel *model = [HomeListModel modelWithJSON:responseObj];
 NSLog(@"%@",responseObj);
 }];
 */


//解析cateforyes.plist文件
//目的：生成解析类。
//现有资源：plist文件  -> 读出NSArray -> 转成JSON
//1、使用NSArray读出plsit文件

//NSString *categoriesFilePath = [[NSBundle mainBundle]pathForResource:@"categories" ofType:@"plist"];
//NSArray *categories = [NSArray arrayWithContentsOfFile:categoriesFilePath];
//NSLog(@"%@",[categories jsonStringEncoded]);
//当JSON的根类型是数组的时候
//NSArray *modelList = [NSArray modelArrayWithClass:[CategoriesModel class] json:[categories jsonStringEncoded]];
//NSArray *modelList = [CategoriesModel parseJSON:categories];
//NSLog(@"%@",modelList);

//解析cities.plist
//    NSString *citiesFilePath =[[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
//    NSArray *cities = [NSArray arrayWithContentsOfFile:citiesFilePath];
//   // NSLog(@"%@",[cities jsonStringEncoded]);
//    NSArray *citiesList = [CitiesModel parseJSON:cities];
//    NSLog(@"%@",citiesList);

//解析city.plist
//    NSString *cityFilePath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
//    NSArray *city = [NSArray arrayWithContentsOfFile:cityFilePath];
//    NSLog(@"%@",[city jsonStringEncoded ]);
//解析citydata.plist文件
//    NSString *cityDataFilePath = [[NSBundle mainBundle] pathForResource:@"citydata" ofType:@"plist"];
//    NSArray *cityData = [NSArray arrayWithContentsOfFile:cityDataFilePath];
//    NSLog(@"%@",[cityData jsonStringEncoded]);
//解析citydict.plsit
//    NSString *cityDictFilePath = [[NSBundle mainBundle] pathForResource:@"citydict" ofType:@"plist"];
//    NSDictionary *cityDict = [NSDictionary dictionaryWithContentsOfFile:cityDictFilePath];
//    NSLog(@"%@",[cityDict jsonStringEncoded]);
//解析cityGroups.plist
//    NSString *cityGroupsFilePath = [[NSBundle mainBundle] pathForResource:@"cityGroups" ofType:@"plist"];
//    NSArray *cityGroups = [NSArray arrayWithContentsOfFile:cityGroupsFilePath];
//    NSLog(@"%@",[cityGroups jsonStringEncoded]);
//解析menuData.plist
//    NSString *menuDataFilePath = [[NSBundle mainBundle] pathForResource:@"menuData" ofType:@"plist"];
//    NSArray *menuData = [NSArray arrayWithContentsOfFile:menuDataFilePath];
//    NSLog(@"%@",[menuData jsonStringEncoded]);
//解析MineInformationData.plist
//    NSString *mineInformationDataFilePath = [[NSBundle mainBundle] pathForResource:@"MineInformationData" ofType:@"plist"];
//    NSArray *mineInformationData = [NSArray arrayWithContentsOfFile:mineInformationDataFilePath];
//    NSLog(@"%@",[mineInformationData jsonStringEncoded]);
//解析PortalSettings.plist
//    NSString *portalSettingsFilePath  = [[NSBundle mainBundle] pathForResource:@"PortalSettings" ofType:@"plist"];
//    NSDictionary *portalSettings = [NSDictionary dictionaryWithContentsOfFile:portalSettingsFilePath];
//    NSLog(@"%@",[portalSettings jsonStringEncoded]);
//解析sorts.plist
//    NSString *sortsFilePath = [[NSBundle mainBundle] pathForResource:@"sorts" ofType:@"plist"];
//    NSArray *sorts = [NSArray arrayWithContentsOfFile:sortsFilePath];
//    NSLog(@"%@",[sorts jsonStringEncoded]);


