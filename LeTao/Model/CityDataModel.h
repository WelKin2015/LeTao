//
//  CityDataModel.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/11.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CityDataCityListModel,CityDataCityListAreaListModel;
@interface CityDataModel : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *provinceName;

@property (nonatomic, strong) NSArray<CityDataCityListModel *> *citylist;

@end

@interface CityDataCityListModel : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) NSArray<CityDataCityListAreaListModel *> *arealist;

@property (nonatomic, copy) NSString *cityName;

@end

@interface CityDataCityListAreaListModel : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *areaName;

@end

