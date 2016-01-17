//
//  CPHtmlPage.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/17.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPHtmlPage.h"

@implementation CPHtmlPage

+(id)htmlPageWithDic:(NSDictionary *)dic{
    CPHtmlPage * page = [[self alloc]init];
    page.title = dic[@"title"];
    page.html = dic[@"html"];
    page.htmlId = dic[@"id"];
    return page;
}

@end
