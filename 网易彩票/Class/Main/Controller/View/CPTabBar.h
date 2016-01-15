//
//  CPTabBar.h
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/14.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPTabBar;
@protocol CPTabBarDelegate <NSObject>

@optional
-(void)tabBar:(CPTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger) to;

@end

@interface CPTabBar : UIView

-(void) addTabButton:(NSString *)icon selectedIcon:(NSString *)selIcon;
@property (nonatomic,weak) id<CPTabBarDelegate> delegate;

@end
