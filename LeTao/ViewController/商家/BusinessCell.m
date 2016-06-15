//
//  BusinessCell.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "BusinessCell.h"

@implementation BusinessCell
-(void)awakeFromNib {
    //去掉cell左侧的空隙
    self.separatorInset = UIEdgeInsetsZero;
    self.layoutMargins = UIEdgeInsetsZero;
    self.preservesSuperviewLayoutMargins = NO;
}

//重写price的set方法
-(void)setPrice:(NSString *)price {
    _price = price;
    NSDictionary *str1Dict = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor redColor]};
    NSAttributedString *str1 = [[NSAttributedString alloc]initWithString:@"￥" attributes:str1Dict];
    NSDictionary *str2Dict =@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor]};
    NSAttributedString *str2 = [[NSAttributedString alloc]initWithString:price attributes:str2Dict];
    NSMutableAttributedString *str = [NSMutableAttributedString new];
    [str appendAttributedString:str1];
    [str appendAttributedString:str2];
    _priceLabel.attributedText = str;
}
@end
