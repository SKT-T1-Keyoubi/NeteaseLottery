//
//  CPAboutController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPAboutController.h"
#import "CPaboutHeaderView.h"
@interface CPAboutController()

@end
@implementation CPAboutController



-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"关于";
    CPSettingArrow * pf = [CPSettingArrow itemWithIcon:@"" title:@"评分支持"];
    CPSettingArrow * kf = [CPSettingArrow itemWithIcon:@"" title:@"客服电话" ];
    CPSettingGroup * group = [[CPSettingGroup alloc]init];
    group.items = @[pf,kf];
    [_allGroups addObject:group];
    //拿到表格的header
    self.tableView.tableHeaderView = [CPaboutHeaderView loadView];
    self.tableView.scrollEnabled = NO;
    
}
@end
