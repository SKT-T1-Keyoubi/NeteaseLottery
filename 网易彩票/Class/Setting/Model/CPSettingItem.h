//
//  CPSettingItem.h
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/15.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//
/**
 *  对应每一个cell
 */

#import <Foundation/Foundation.h>
typedef enum {
    CPSettingItemTypeNone,//空
    CPSettingItemTypeArrow,//箭头
    CPSettingItemTypeSwitch//开关
}CPSettingItemType;
@interface CPSettingItem : NSObject
/**
 *  公共属性
 */
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString * title;
//cell的样式
@property (nonatomic,assign) CPSettingItemType type;
//点击cell要做的事情
@property (nonatomic,copy) void (^operation)();

+(id) itemWithIcon:(NSString *)icon title:(NSString *)title type:(CPSettingItemType)type;

@end
