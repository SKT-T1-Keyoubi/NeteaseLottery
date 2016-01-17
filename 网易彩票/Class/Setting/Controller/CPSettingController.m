//
//  CPSettingController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/15.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPSettingController.h"
#import "CPSendController.h"
#import "CPShareToFriends.h"
#import "CPAboutController.h"
#import "CPProductController.h"
@interface CPSettingController()
@end
@implementation CPSettingController


-(void)viewDidLoad{
    [super viewDidLoad];
    //第0组1个
    [self addOneSectionItems];
    //第二组4个
    [self addTwoSectionItems];
    //第三组四个
    [self addThreeSectionItems];
}
-(void)dealloc{
    CPLog(@"----setting-----dealloc---");
}
#pragma mark - 添加第一组数据
-(void) addOneSectionItems{
    CPSettingArrow * moneyCode = [CPSettingArrow itemWithIcon:@"RedeemCode" title:@"使用兑换码"];
    moneyCode.operation = ^{
        CPLog(@"dsdsd");
    };
    CPSettingGroup * groupOne = [[CPSettingGroup alloc]init];
    groupOne.header = @"SectionOneHeader";
    groupOne.footer = @"SectionOneFooter";
    groupOne.items = @[moneyCode];
    [_allGroups addObject:groupOne];
}
#pragma mark - 添加第二组数据
-(void) addTwoSectionItems{
    //2.1推送和提醒
    CPSettingArrow * send = [CPSettingArrow itemWithIcon:@"MorePush" title:@"推送和提醒"];
    send.showVcClass = [CPSendController class];
//    /**
//     *  这里会发生block的循环引用，用弱指针解决
//     */
//    __weak CPSettingController * setting = self;
//    send.operation = ^{
//        CPSendController * sendVc = [[CPSendController alloc]init];
//        //sendVc.view.backgroundColor = [UIColor blueColor];
//        [setting.navigationController pushViewController:sendVc animated:YES];
//    };
    //CPLog(@"fgdg");
    //2.2摇一摇机选
    CPSettingSwitch * shake = [CPSettingSwitch itemWithIcon:@"HandShake" title:@"摇一摇机选"];
    //2.3声音效果
    CPSettingSwitch * sound = [CPSettingSwitch itemWithIcon:@"sound_Effect" title:@"声音效果"];
    //2.4圈子仅Wifi加载图片
    CPSettingSwitch * friends = [CPSettingSwitch itemWithIcon:@"More_QuanZi_NetFlowSwitchImage" title:@"圈子仅Wifi加载图片"];
    CPSettingGroup * groupTwo = [[CPSettingGroup alloc]init];
    groupTwo.header = @"SectionTwoHeader";
    groupTwo.footer = @"SectionTwoFooter";
    groupTwo.items = @[send,shake,sound,friends];
    [_allGroups addObject:groupTwo];

}
#pragma mark - 添加第三组数据
-(void) addThreeSectionItems{
    //3.1 推荐给朋友
    CPSettingArrow * share = [CPSettingArrow itemWithIcon:@"MoreShare" title:@"推荐给朋友" ];
    share.showVcClass = [CPShareToFriends class];
    
    //3.2产品推荐
    CPSettingArrow * product = [CPSettingArrow itemWithIcon:@"MoreNetease" title:@"产品推荐"];
    product.showVcClass = [CPProductController class];
    //3.3服务协议
    CPSettingArrow * sever = [CPSettingArrow itemWithIcon:@"MoreServiceAgreement" title:@"服务协议"];
    //3.4关于
    CPSettingArrow * about = [CPSettingArrow itemWithIcon:@"MoreAbout" title:@"关于"];
    about.showVcClass = [CPAboutController class];
//    __weak CPSettingController * setting = self;
//
//    about.operation = ^{
//        UIViewController * vc = [[UIViewController alloc]init];
//        vc.view.backgroundColor = [UIColor purpleColor];
//        vc.title = @"帮助";
//        [setting.navigationController pushViewController:vc animated:YES];
//    };
    CPSettingGroup * groupThree = [[CPSettingGroup alloc]init];
    groupThree.header = @"SectionThreeHeader";
    groupThree.footer = @"SectionThreeFooter";
    groupThree.items = @[share,product,sever,about];
    [_allGroups addObject:groupThree];
}
@end
