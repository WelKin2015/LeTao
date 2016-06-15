//
//  CitiesModel.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/10.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CitiesRegionsModel ;
@interface CitiesModel : NSObject

@property (nonatomic, copy) NSString *pinYin;

@property (nonatomic, copy) NSString *pinYinHead;

@property (nonatomic, strong) NSArray<CitiesRegionsModel *> *regions;

@property (nonatomic, copy) NSString *name;

@end

@interface CitiesRegionsModel : NSObject

@property (nonatomic, copy) NSString *name;

@end

