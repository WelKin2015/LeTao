//
//  CityModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/10.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel
//返回一个Dict，将Model属性名映射到JSON的key
+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"ID":@"id"
             };
}

@end


