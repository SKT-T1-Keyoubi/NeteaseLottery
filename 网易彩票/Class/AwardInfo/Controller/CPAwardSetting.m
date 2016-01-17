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
    CPSettingSwitch * ssq = [CPSettingSwitch itemWithIcon:@"" title:@"双色球"];
    CPSettingSwitch * dlt = [CPSettingSwitch itemWithIcon:@"" title:@"大乐透"];
    CPSettingSwitch * threeD = [CPSettingSwitch itemWithIcon:@"" title:@"3D"];
    CPSettingSwitch * qlc = [CPSettingSwitch itemWithIcon:@"" title:@"七乐彩"];
    CPSettingSwitch * qxc = [CPSettingSwitch itemWithIcon:@"" title:@"七星彩"];
    CPSettingSwitch * plThree = [CPSettingSwitch itemWithIcon:@"" title:@"排列3"];
     CPSettingSwitch * plFive = [CPSettingSwitch itemWithIcon:@"" title:@"排列5"];
    CPSettingGroup * group = [[CPSettingGroup alloc]init];
    group.header = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    group.items = @[ssq,dlt,threeD,qlc,qxc,plThree,plFive];
    [_allGroups addObject:group];
}


@end
