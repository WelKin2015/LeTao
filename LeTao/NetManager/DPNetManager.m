//
//  DPNetManager.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "DPNetManager.h"

@implementation DPNetManager

+(void)getBusinessesWithCategory:(NSString *)category page:(NSInteger)page completionHandler:(void (^)(BusinessModel *, NSError *))completionHandler {
    //使用点评网提供的方法获取完成的链接地址
    //@YES @1 @(数字变量)->NSNumber类型
    NSDictionary *param = @{
                            @"city":kCurrentCity,
                            @"platform":@2,
                            @"page":@(page),
                            @"category":category
                            };
    NSString *path = [DPRequest serializeURL:@"http://api.dianping.com/v1/business/find_businesses"  params:param];
    [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([BusinessModel parseJSON:responseObj],error);
    }];
    
}

@end
