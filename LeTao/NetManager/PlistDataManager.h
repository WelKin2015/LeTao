//
//  PlistDataManager.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/11.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  "CategoriesModel.h"
#import "CityModel.h"
#import "CitiesModel.h"
#import "CityDataModel.h"
#import "CityDictModel.h"
#import "CityGroupsModel.h"
#import "MenuDataModel.h"
#import "MineInformationDataModel.h"
#import "PortalSettingsModel.h"
#import "SortsModel.h"

@interface PlistDataManager : NSObject

+(void)getCategories :(void(^) (NSArray<CategoriesModel *> *categories, NSError *error) )completionHandler ;

+(void)getCities :(void(^)(NSArray <CitiesModel *> *cities ,NSError *error ) )completionHandler;

+(void)getCity :(void(^)(NSArray <CityModel *> *city ,NSError *error) )completionHandler;

+(void)getCityData :(void(^) (NSArray <CityDataModel *> *cityData, NSError *error ) )completionHandler;

+(void)getCityDict :(void (^) (CityDictModel *cityDic , NSError *error ) )completionHandler;

+(void)getCtiyGroups :(void(^) (NSArray <CityGroupsModel *> *cityGroups ,NSError *error ))completionHandler;

+(void)getMenuData :(void(^)(NSArray <MenuDataModel *> *menuData, NSError *error ))completionHandler;

+(void)getMineInformationData :(void(^)(NSArray <MineInformationDataModel *> *mienInformationData, NSError *error))completionHandler;

+(void)getPortalSettings :(void(^)(PortalSettingsModel  *portalSettings , NSError *error))completionHandler;

+(void)getSorts :(void(^)(NSArray <SortsModel *> *sorts ,NSError *error ))completionHandler;

@end
