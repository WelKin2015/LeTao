//
//  BusinessViewModel.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPNetManager.h"
typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeFresh,//刷新数据
    RequestModeMore,//获取更多数据
};

@interface BusinessViewModel : NSObject
/**根据UI确定属性和方法*/
/** 行数*/
@property (nonatomic) NSInteger rowNumber;

/**获取商户详情的链接地址*/
-(NSURL *)businessURLForIndex : (NSInteger) index;
-(NSURL *)iconURLForIndex : (NSInteger) index;
-(NSString *) shopNumberForIndex : (NSInteger) index;
-(NSString *)discountForIndex : (NSInteger) index;
-(NSString *)saledNumberForIndex : (NSInteger) index;
-(NSString *)orginalPriceForIndex : (NSInteger) index;
-(NSString *)currentPriceForIndex : (NSInteger) index;

/**根据Model确定属性和方法*/
/** 数据组*/
@property (nonatomic,strong) NSMutableArray<BusinessBusinessesModel *> *dataList;
/** 页数*/
@property (nonatomic,assign) NSInteger pageNumber;

-(void)getBusinessWithCateory:(NSString *)category requestMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;

@end
