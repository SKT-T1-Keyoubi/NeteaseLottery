//
//  CPProductCell.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/17.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPProductCell.h"
#import "CPProduct.h"
#import <QuartzCore/QuartzCore.h>
@interface CPProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
@implementation CPProductCell

-(void)awakeFromNib{
    //xib只会调用这个方法
    _iconView.layer.cornerRadius = 8;
    _iconView.layer.masksToBounds = YES;
//    NSArray * array = @[@"icon_back"];
//    _iconView.layer.backgroundFilters = array;
    //_iconView.layer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_back"]].CGColor;
}

-(void)setProduct:(CPProduct *)product{
    _product = product;
    _iconView.image = [UIImage imageNamed:product.icon];
    //_iconView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_back"]];
    _title.text = product.title;
    _title.textAlignment = NSTextAlignmentCenter;
}

@end
