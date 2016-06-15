//
//  CitiesModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/10.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "CitiesModel.h"

@implementation CitiesModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"regions": [CitiesRegionsModel class]};
}

@end

@implementation CitiesRegionsModel

@end

