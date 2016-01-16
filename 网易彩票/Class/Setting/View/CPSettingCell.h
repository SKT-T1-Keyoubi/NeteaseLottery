//
//  CPSettingCell.h
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CPSettingItem;
@interface CPSettingCell : UITableViewCell
@property (nonatomic,strong) CPSettingItem * item;
+(id) getCellFromTableView:(UITableView *) tableView;
@end
