//
//  CPAwardSetting.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPAwardSetting.h"

@implementation CPAwardSetting

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"推送和提醒";
    
    [self addOneSectionItems];
}

#pragma mark - 添加一组Section
-(void) addOneSectionItems{
    CPSettingItem * ssq = [CPSettingItem itemWithIcon:@"" title:@"双色球" type:CPSettingItemTypeSwitch];
    CPSettingItem * dlt = [CPSettingItem itemWithIcon:@"" title:@"大乐透" type:CPSettingItemTypeSwitch];
    CPSettingItem * threeD = [CPSettingItem itemWithIcon:@"" title:@"3D" type:CPSettingItemTypeSwitch];
    CPSettingItem * qlc = [CPSettingItem itemWithIcon:@"" title:@"七乐彩" type:CPSettingItemTypeSwitch];
    CPSettingItem * qxc = [CPSettingItem itemWithIcon:@"" title:@"七星彩" type:CPSettingItemTypeSwitch];
    CPSettingItem * plThree = [CPSettingItem itemWithIcon:@"" title:@"排列3" type:CPSettingItemTypeSwitch];
     CPSettingItem * plFive = [CPSettingItem itemWithIcon:@"" title:@"排列5" type:CPSettingItemTypeSwitch];
    CPSettingGroup * group = [[CPSettingGroup alloc]init];
    group.header = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    group.items = @[ssq,dlt,threeD,qlc,qxc,plThree,plFive];
    [_allGroups addObject:group];
}


@end
