//
//  CityDataModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/11.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "CityDataModel.h"

@implementation CityDataModel
//添加类映射
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"citylist": [CityDataCityListModel class]};
}

//返回一个Dict，将Model属性名映射到JSON的key
+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"ID":@"id"
             };
}

@end

@implementation CityDataCityListModel
//添加类映射
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"arealist": [CityDataCityListAreaListModel class]};
}

//返回一个Dict，将Model属性名映射到JSON的key
+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"ID":@"id"
             };
}

@end

@implementation CityDataCityListAreaListModel
//返回一个Dict，将Model属性名映射到JSON的key
+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"ID":@"id"
             };
}
@end
