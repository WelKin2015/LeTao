//
//  NSObject+Networking.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/5.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NSObject (Networking)

+(id)GET:(NSString *) path parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress *downloadProgress)) downloadProgress completionHandler:(void(^)(id responseObj, NSError *error)) completionHandler;

+(id)POST:(NSString *) path parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress *downloadProgress)) downloadProgress completionHandler:(void(^)(id responseObj, NSError *error)) completionHandler;

@end
