//
//  UINavigationItem+showIndex.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/15.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "UINavigationItem+showIndex.h"

@implementation UINavigationItem (showIndex)

-(void) showIndex:(UIViewController *)vc{
    self.leftBarButtonItem = vc.navigationItem.leftBarButtonItem;
    self.leftBarButtonItems = vc.navigationItem.leftBarButtonItems;
    self.rightBarButtonItem = vc.navigationItem.rightBarButtonItem;
    self.rightBarButtonItems = vc.navigationItem.rightBarButtonItems;
    self.title = vc.navigationItem.title;
    self.titleView = vc.navigationItem.titleView;
}

@end
