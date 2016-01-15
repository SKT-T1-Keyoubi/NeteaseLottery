//
//  CPTabBar.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/14.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPTabBar.h"
@interface CPTabBar()<CPTabBarDelegate>
{
    UIButton * _selectedButton;
}
@end
@implementation CPTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       // self.backgroundColor = [UIColor yellowColor];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ToolBarBackground"]];
        
    }
    return self;
}
#pragma mark - 添加tabBarButton
-(void) addTabButton:(NSString *)icon selectedIcon:(NSString *)selIcon{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selIcon] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    [self setUpButtonFrame];
    button.tag = self.subviews.count-1;
    /**
     *  默认选中第一个按钮
     */
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}
#pragma mark - 设置tabBarButton的位置
- (void) setUpButtonFrame{
    CGFloat count = self.subviews.count;
    CPLog(@"%f",count);
    for (int i = 0; i < count; i++) {
        UIButton * button = self.subviews[i];
        //设置Frame
       // CGFloat maigin = ((self.frame.size.width/(count)))/(count - 1);
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width / (count + 1);
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonX = i * buttonW +  31.25;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
       // CPLog(@"%f",(self.frame.size.width/(count + 1))/2);
    }
}
#pragma mark - button选中状态为黄色
- (void) buttonClick:(UIButton *)button{
    /**
     *  通知代理
     */
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [_delegate tabBar:self didSelectButtonFrom:_selectedButton.tag to:button.tag];
    }
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
}

@end
