//
//  PlistDataManager.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/11.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "PlistDataManager.h"

@implementation PlistDataManager

+(NSArray *)getArrFormPlsit :(NSString *)plistName {
    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:plistName ofType:@"plist"]];
}

+(NSDictionary *) getDictFromPlist :(NSString *)plistName {
    return [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:plistName ofType:@"plist"]];
}
            
+(void)getCategories:(void (^)(NSArray <CategoriesModel *>*, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *tempArr = [CategoriesModel parseJSON:[self getArrFormPlsit:@"categories"]];
        dispatch_async(dispatch_get_main_queue(), ^{
                    completionHandler(tempArr,nil);
        });
    });
}

+(void)getCities:(void (^)(NSArray<CitiesModel *> *, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *tempArr = [CitiesModel parseJSON:[self getArrFormPlsit:@"cities"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tempArr,nil);
        });
    });
}

+(void)getCity:(void (^)(NSArray<CityModel *> *, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *tempArr = [CityModel parseJSON:[self getArrFormPlsit:@"city"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tempArr,nil);
        });
    });
}

+(void)getCityData:(void (^)(NSArray<CityDataModel *> *, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *tempArr = [CityDataModel parseJSON:[self getArrFormPlsit:@"citydata"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tempArr,nil);
        });
    });
}


+(void)getCityDict:(void (^)(CityDictModel *, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CityDictModel *tempDict = [CityDictModel parseJSON:[self getDictFromPlist:@"citydict"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tempDict,nil);
        });
    });
}

+(void)getCtiyGroups:(void (^)(NSArray<CityGroupsModel *> *, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *tempArr = [CityGroupsModel parseJSON:[self getArrFormPlsit:@"cityGroups"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tempArr,nil);
        });
    });
}

+(void)getMenuData:(void (^)(NSArray<MenuDataModel *> *, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *tempArr = [MenuDataModel parseJSON:[self getArrFormPlsit:@"menuData"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tempArr,nil);
        });
    });
}

+(void)getMineInformationData:(void (^)(NSArray<MineInformationDataModel *> *, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSArray *tempArr = [MineInformationDataModel parseJSON:[self getArrFormPlsit:@"MineInformationData"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tempArr,nil);
        });
    });
}
+(void)getPortalSettings:(void (^)(PortalSettingsModel *, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        PortalSettingsModel *tempDict = [PortalSettingsModel parseJSON:[self getDictFromPlist:@"PortalSettings"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tempDict,nil);
        });
    });
}

+(void)getSorts:(void (^)(NSArray<SortsModel *> *, NSError *))completionHandler {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *tempArr = [SortsModel parseJSON:[self getArrFormPlsit:@"sorts"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tempArr,nil);
        });
    });
}

@end
