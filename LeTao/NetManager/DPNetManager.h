//
//  DPNetManager.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPRequest.h"
#import "BusinessModel.h"
#import "DealModel.h"

@interface DPNetManager : NSObject

/**
 *  请求商家信息
 *  参数：页数，从1开始；类型：美食、电影......
 */
+(void) getBusinessesWithCategory :(NSString *)category page:(NSInteger) page completionHandler :(void(^)(BusinessModel *model, NSError *error))completionHandler;


@end
