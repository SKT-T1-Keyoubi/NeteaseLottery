//
//  CPShareToFriends.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPShareToFriends.h"
@interface CPShareToFriends()<UIAlertViewDelegate>

@end
@implementation CPShareToFriends

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"推荐给朋友";
    
    [self addOneSectionItems];
}

#pragma mark - 添加一组Section
-(void) addOneSectionItems{
    CPSettingArrow * wxFriends = [CPSettingArrow itemWithIcon:@"" title:@"微信朋友圈" ];
    CPSettingArrow * wx = [CPSettingArrow itemWithIcon:@"" title:@"微信" ];
    CPSettingArrow * qqSpace = [CPSettingArrow itemWithIcon:@"" title:@"QQ空间" ];
    CPSettingArrow * qqFriends = [CPSettingArrow itemWithIcon:@"" title:@"QQ好友" ];
    CPSettingArrow * weibo = [CPSettingArrow itemWithIcon:@"" title:@"新浪微博" ];
    CPSettingArrow * message = [CPSettingArrow itemWithIcon:@"" title:@"短信" ];
    CPSettingGroup * group = [[CPSettingGroup alloc]init];
    group.items = @[wxFriends,wx,qqSpace,qqFriends,weibo,message];
    [_allGroups addObject:group];
}
#pragma mark - tableView数据源方法
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"分享" message:@"确认分享到微信朋友圈吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}
#pragma mark - alertView方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        CPLog(@"分享到微信朋友圈");
    }
}
@end
