//
//  ViewController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/14.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "ViewController.h"
#import "CPTabBar.h"
@interface ViewController ()

@property (nonatomic,weak) UITabBar * tabBarF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
/**
 *  除去系统自带的tabBar
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    /**
     *  代码只执行一次
     */
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        for (UIView * btn in self.tabBar.subviews) {
//            [btn removeFromSuperview];
//        }
        [self.tabBar removeFromSuperview];
    });
    //self.tabBar.backgroundImage = [UIImage imageNamed:@"tableTexture"];
    CPLog(@"%@",self.tabBar.subviews);
    CPTabBar * myTabBar = [[CPTabBar alloc]init];
    myTabBar.frame = self.tabBar.frame;
//    myTabBar.backgroundColor = [UIColor redColor];
    [self.view addSubview:myTabBar];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
