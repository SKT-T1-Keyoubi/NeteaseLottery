//
//  CPNavigationController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/15.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPNavigationController.h"

@interface CPNavigationController ()

@end

@implementation CPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationBar.backgroundColor = [UIColor redColor];
    //self.navigationBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBar"]];
    }
#pragma mark - 一个类只会调用一次
+(void)initialize{
    //取出设置主题的对象
    UINavigationBar * navBar = [UINavigationBar appearance];
    UIBarButtonItem * btnItem = [UIBarButtonItem appearance];
    //设置导航栏的背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"Circle_MyCircleHeader"] forBarMetrics:UIBarMetricsDefault];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    CGFloat version = [[[UIDevice currentDevice] systemVersion]floatValue];
//    CPLog(@"%f",version);
    //设置导航栏标题颜色白色
    [navBar setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor]}];
    [btnItem setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor]} forState:UIControlStateNormal];
    //设置导航栏的渐变色为白色
    navBar.tintColor = [UIColor whiteColor];
}

@end
