//
//  BusinessCell.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusinessCell : UITableViewCell
/**商家图片*/
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
/**已购数量*/
@property (weak, nonatomic) IBOutlet UILabel *saledNumberLabel;
/**商家名称*/
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**价格*/
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
/**折扣*/
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;

//设置价格为：￥80
@property (nonatomic,strong) NSString *price;

@end
