//
//  CPHtmlPage.h
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/17.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPHtmlPage : NSObject

@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * html;
@property (nonatomic,copy) NSString * htmlId;

+(id)htmlPageWithDic:(NSDictionary *)dic;

@end
