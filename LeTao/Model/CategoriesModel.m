//
//  CategoriesModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/6.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "CategoriesModel.h"

@implementation CategoriesModel

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"mapIcon": @"map_icon",
             @"highlightedIcon": @"highlighted_icon",
             @"smallHighlightedIcon": @"small_highlighted_icon",
             @"smallIcon": @"small_icon"};
}
@end

