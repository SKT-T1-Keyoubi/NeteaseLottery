//
//  CPSettingGroup.h
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPSettingGroup : NSObject
@property (nonatomic,copy) NSString * header;
@property (nonatomic,copy) NSString * footer;
@property (nonatomic,strong) NSArray * items;
@end
