//
//  CPSendController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPSendController.h"

@interface CPSendController()
@end
@implementation CPSendController

-(void)viewDidLoad{
    [super viewDidLoad];

    self.title = @"推送和提醒";

    [self addOneSectionItems];
}

#pragma mark - 添加一组Section
-(void) addOneSectionItems{
    CPSettingArrow * zj = [CPSettingArrow itemWithIcon:@"" title:@"中奖推送"];
    CPSettingArrow * kj = [CPSettingArrow itemWithIcon:@"" title:@"开奖推送" ];
    CPSettingArrow * bf = [CPSettingArrow itemWithIcon:@"" title:@"比分直播推送"];
    CPSettingArrow * dh = [CPSettingArrow itemWithIcon:@"" title:@"中奖动画"];
    CPSettingArrow * gc = [CPSettingArrow itemWithIcon:@"" title:@"购彩提醒"];
    CPSettingArrow * qz = [CPSettingArrow itemWithIcon:@"" title:@"圈子推送"];
    CPSettingGroup * group = [[CPSettingGroup alloc]init];
    group.items = @[zj,kj,bf,dh,gc,qz];
    [_allGroups addObject:group];
}
@end
