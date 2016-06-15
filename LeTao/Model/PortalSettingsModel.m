//
//  PortalSettingsModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/11.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "PortalSettingsModel.h"

@implementation PortalSettingsModel

//添加类映射
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"maps": [PortalSettingsMapsModel class]};
}

@end
@implementation PortalSettingsMapsModel

@end


