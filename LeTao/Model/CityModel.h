//
//  CityModel.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/10.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject

@property (nonatomic, assign) BOOL isOpen;

@property (nonatomic, copy) NSString *pinyin;
//id -> ID
@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) CGFloat lat;

@property (nonatomic, assign) CGFloat lng;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *divisionStr;

@end

