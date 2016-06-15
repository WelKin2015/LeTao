//
//  NSObject+Parse.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/10.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)

-(NSString *)description {
    return [self modelDescription];
}

+(id)parseJSON:(id)json {
    if ([json isKindOfClass:[NSDictionary class]]) {
        return [self modelWithJSON:json];
    }
    if ([json isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:json];
    }
    return json;
}

@end
