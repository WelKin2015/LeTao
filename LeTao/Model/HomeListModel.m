//
//  HomeListModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/6.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "HomeListModel.h"

@implementation HomeListModel

+(NSDictionary *) modelContainerPropertyGenericClass {
    return @{@"recommend":[HomeListRecommendModel class],
                    @"data":[HomeListDataModel class]
                    };
}

@end

@implementation HomeListDataModel
//返回一个Dict，将Model属性名映射到JSON的key
+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"weightAdd":@"weight_add",
             @"followAdd":@"follow_add",
             @"playCount":@"play_count",
             @"negativeView":@"negative_view",
             @"coinAdd":@"coin_add",
             @"defaultImage":@"default_image",
             @"categoryName":@"category_name",
             @"createAt":@"create_at",
             @"recommendImage":@"recommend_image",
             @"lockedView":@"locked_view",
             @"lastEndAt":@"last_end_at",
             @"videoQuality":@"video_quality",
             @"firstPlayAt":@"first_play_at",
             @"followBak":@"follow_bak",
             @"playAt":@"play_at",
             @"ategoryID":@"ategory_id",
             @"categorySlug":@"category_slug",
             @"appShufflingImage":@"app_shuffling_image"
             };
}
@end

@implementation HomeListRecommendModel
+(NSDictionary *) modelContainerPropertyGenericClass{
    return @{
             @"recommendData":[HomeListRecommendDataModel class]
             };
}
//返回一个Dict，将Model属性名映射到JSON的key
+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"recommendData":@"data"
             };
}
@end

@implementation HomeListRecommendDataModel
+(NSDictionary *) modelContainerPropertyGenericClass {
    return @{
             @"recommendDataLinkObject":[HomeListRecommendDataLinkObjectModel class]
             };
}
//返回一个Dict，将Model属性名映射到JSON的key
+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"recommendDataLinkObject":@"link_object",
             @"ID":@"id",
             @"subTitle":@"subtitle",
             @"slotID":@"slot_id",
             @"createAt":@"create_at"
             };
}
@end

@implementation HomeListRecommendDataLinkObjectModel

//返回一个Dict，将Model属性名映射到JSON的key
+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"weightAdd":@"weight_add",
             @"followAdd":@"follow_add",
             @"playCount":@"play_count",
             @"negativeView":@"negative_view",
             @"coinAdd":@"coin_add",
             @"defaultImage":@"default_image",
             @"categoryName":@"category_name",
             @"createAt":@"create_at",
             @"recommendImage":@"recommend_image",
             @"lockedView":@"locked_view",
             @"lastEndAt":@"last_end_at",
             @"videoQuality":@"video_quality",
             @"firstPlayAt":@"first_play_at",
             @"followBak":@"follow_bak",
             @"playAt":@"play_at",
             @"ategoryID":@"ategory_id",
             @"categorySlug":@"category_slug",
             @"appShufflingImage":@"app_shuffling_image"
             };
}
@end