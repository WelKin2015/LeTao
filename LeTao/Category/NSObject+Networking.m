//
//  NSObject+Networking.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/5.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "NSObject+Networking.h"
#define kTimeoutInterval 30

@implementation NSObject (Networking)

+(id)GET:(NSString *)path parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //让AFN接受除了JSON以外的数据类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"text/json",@"text/javascript",@"application/json", nil];
    //请求超时时间
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil,error);
    }];
}

+(id)POST:(NSString *)path parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //让AFN接受除了JSON以外的数据类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"text/json",@"text/javascript",@"application/json", nil];
    //请求超时时间
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil,error);
    }];
}
@end
