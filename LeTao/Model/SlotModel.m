//
//  SlotModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/6.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "SlotModel.h"

@implementation SlotModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"pcBanner": [SlotPcBannerModel class],
             @"list": [SlotListModel class],
             @"playerGuanggao": [SlotPcBannerModel class],
             @"pcBanner2": [SlotPcBannerModel class]};
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"playerGuanggao": @"player-guanggao",
             @"appAd": @"app-ad",
             @"pcBanner": @"pc-banner",
             @"pcBanner2": @"pc-banner2"};
}


@end


@implementation SlotPcBannerModel

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"slotId": @"slot_id",
             @"createAt": @"create_at",
             @"ID": @"id"};
}

@end


@implementation SlotListModel

@end
