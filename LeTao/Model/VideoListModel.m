//
//  VideoListModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/5.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "VideoListModel.h"

@implementation VideoListModel
/*
//防止KVC对不存在的Key赋值导致的crash
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
}
//防止KVC对key赋nil导致的崩溃
-(void)setNilValueForKey:(NSString *)key {
}
*/
+(NSDictionary *) modelContainerPropertyGenericClass {
    //表示属性videoSidList中的元素使用VideoListVideosidlistModel类来解析
    return @{
             @"videoList":[VideoListVideolistModel class],
             @"videoSidList":[VideoListVideosidlistModel class]
             };
}
@end

@implementation VideoListVideolistModel
//返回一个Dict，将Model属性名映射到JSON的key
+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"desc":@"description",
             @"pTime":@"ptime",
             @"videoSource":@"videosource",
             @"sectionTitle":@"sectiontitle",
             @"m3u8URL":@"m3u8_url",
             @"playerSize":@"playersize",
             @"mp4HdURL":@"mp4Hd_url",
             @"replyID":@"replyid",
             @"m3u8HdURL":@"m3u8Hd_url",
             @"mp4URL":@"mp4_url"
             };
}

@end

@implementation VideoListVideosidlistModel


@end