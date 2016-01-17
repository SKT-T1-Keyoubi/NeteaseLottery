//
//  CPSettingCell.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPSettingCell.h"
#import "CPSettingItem.h"
#import "CPSettingArrow.h"
#import "CPSettingSwitch.h"
@interface CPSettingCell()

{
    UIImageView * Arrow;
    UISwitch * Switch;
}

@end
@implementation CPSettingCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
#pragma mark - 从缓冲池中取cell
+(id) getCellFromTableView:(UITableView *) tableView{
    static NSString * ID = @"cell";
    //去缓存池中查找对应的cell
    CPSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //如果没有再创建cell
    if (cell == nil) {
        cell = [[CPSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 自定义cell
-(void)setItem:(CPSettingItem *)item{
    
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    if ([item isKindOfClass:[CPSettingArrow class]]) {
        [self setUpArrow];
    }else if ([item isKindOfClass:[CPSettingSwitch class]]){
        [self setUpSwitch];
    }else{
        /**
         *  注意：这里的清空是因为cell是循环利用的！
         */
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }
    _item = item;
}
#pragma mark - 设置右边的箭头
-(void) setUpArrow{
    //没有才创建，优化性能！
    if (Arrow == nil) {
        Arrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    self.selectionStyle = UITableViewCellSelectionStyleBlue;
    self.accessoryView = Arrow;
}
#pragma mark - 设置右边的switch开关
-(void) setUpSwitch{
    //禁止表格框可点击
    if (Switch == nil) {
        Switch = [[UISwitch alloc]init];
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryView = Switch;
}
@end
