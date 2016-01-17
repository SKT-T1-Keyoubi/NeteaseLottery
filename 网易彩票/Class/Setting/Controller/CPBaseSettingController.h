//
//  CPBaseSettingController.h
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPSettingArrow.h"
#import "CPSettingSwitch.h"
#import "CPSettingGroup.h"

@interface CPBaseSettingController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray * _allGroups;//所有的item模型
}
@property (nonatomic,weak,readonly) UITableView * tableView;
@end
