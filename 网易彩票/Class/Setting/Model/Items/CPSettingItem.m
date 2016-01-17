//
//  CPSettingItem.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/15.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPSettingItem.h"

@implementation CPSettingItem

+(id) itemWithIcon:(NSString *)icon title:(NSString *)title{
    CPSettingItem * item = [[self alloc]init];
    item.icon = icon;
    item.title = title;
    return item;
    
}

@end
