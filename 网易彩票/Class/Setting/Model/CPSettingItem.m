//
//  CPSettingItem.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/15.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPSettingItem.h"

@implementation CPSettingItem

+(id) itemWithIcon:(NSString *)icon title:(NSString *)title type:(CPSettingItemType)type{
    CPSettingItem * item = [[self alloc]init];
    item.icon = icon;
    item.title = title;
    item.type = type;
    return item;
    
}

@end
