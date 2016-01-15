//
//  ViewController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/14.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "ViewController.h"
#import "CPTabBar.h"
#import "CPAwardController.h"
#import "CPBuyController.h"
#import "CPDiscoveryController.h"
#import "CPHallController.h"
#import "CPProfileViewController.h"
#import "UINavigationItem+showIndex.h"
@interface ViewController ()<CPTabBarDelegate>

@property (nonatomic,weak) UITabBar * tabBarF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.backgroundColor = [UIColor redColor];

}

#pragma mark - 除去系统自带的tabBar
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    /**
     *  代码只执行一次
     */
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         CPLog(@"%lu",(unsigned long)self.tabBar.subviews.count);
        [self.tabBar removeFromSuperview];
       
        CPTabBar * myTabBar = [[CPTabBar alloc]init];
        myTabBar.frame = self.tabBar.frame;
        myTabBar.delegate = self;
        //myTabBar.backgroundColor = [UIColor redColor];
        [self.view addSubview:myTabBar];
        /**
         *  添加五个按钮
         */
        [myTabBar addTabButton:@"TabBar_LotteryHall" selectedIcon:@"TabBar_LotteryHall_selected"];
        [myTabBar addTabButton:@"TabBar_HYG" selectedIcon:@"TabBar_HYG_selected"];
        //[myTabBar addTabButton:@"TabBar_Arena" selectedIcon:@"TabBar_Arena_selected"];
        [myTabBar addTabButton:@"TabBar_Discovery" selectedIcon:@"TabBar_Discovery_selected"];
        [myTabBar addTabButton:@"TabBar_History" selectedIcon:@"TabBar_History_selected"];
        [myTabBar addTabButton:@"TabBar_MyLottery" selectedIcon:@"TabBar_MyLottery_selected"];
    });
   
}
#pragma mark - tabBar代理方法
-(void)tabBar:(CPTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to{
    /**
     *  选中某个控制器
     */
    self.selectedIndex = to;
    //获取当前选中的控制器
    UIViewController * vc = self.childViewControllers[to];
    [self.navigationItem showIndex:vc];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end