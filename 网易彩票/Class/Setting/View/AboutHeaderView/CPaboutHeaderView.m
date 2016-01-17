//
//  CPaboutHeaderView.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/17.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPaboutHeaderView.h"

@implementation CPaboutHeaderView

+(id)loadView{
    return [[NSBundle mainBundle] loadNibNamed:@"CPaboutHeaderView" owner:nil options:nil][0];
}

@end
