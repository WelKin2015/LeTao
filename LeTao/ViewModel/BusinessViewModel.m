//
//  BusinessViewModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "BusinessViewModel.h"

@implementation BusinessViewModel

-(NSInteger)rowNumber {
    return self.dataList.count;
}

-(NSURL *)businessURLForIndex:(NSInteger)index {
    return [NSURL URLWithString:self.dataList[index].businessURL];
}

-(NSURL *)iconURLForIndex:(NSInteger)index {
    return [NSURL URLWithString: self.dataList[index].photoURL];
}

-(NSString *)shopNumberForIndex:(NSInteger)index {
    return self.dataList[index].name;
}

-(NSString *)saledNumberForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"浏览%ld",self.dataList[index].reviewCount];
}

-(NSString *)discountForIndex:(NSInteger)index {
    return nil;
}

-(NSString *)orginalPriceForIndex:(NSInteger)index {
    return nil;
}

-(NSString *)currentPriceForIndex:(NSInteger)index {
    return @(self.dataList[index].avgPrice).stringValue;
}

-(NSMutableArray<BusinessBusinessesModel *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

-(void)getBusinessWithCateory:(NSString *)category requestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    //定义一个临时页数
    NSInteger tempPage = 1;
    if (requestMode == RequestModeMore) {
        tempPage = _pageNumber +1;
    }
    [DPNetManager getBusinessesWithCategory:category page:tempPage completionHandler:^(BusinessModel *model, NSError *error) {
        if (!error) {
            _pageNumber = tempPage;
            if (requestMode == RequestModeFresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.businesses];
        }
        completionHandler(error);
    }];
}

@end
