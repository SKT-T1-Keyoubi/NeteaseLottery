//
//  CPSettingController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/15.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPSettingController.h"
#import "CPSettingItem.h"
@interface CPSettingController()
{
    NSArray * _allItems;//所有的item模型
}
@end
@implementation CPSettingController


-(void)viewDidLoad{
    [super viewDidLoad];
    //第0组1个
    CPSettingItem * moneyCode = [CPSettingItem itemWithIcon:@"RedeemCode" title:@"使用兑换码" type:CPSettingItemTypeArrow];
    moneyCode.operation = ^{
        CPLog(@"dsdsd");
    };
    //第二组4个
    
    //2.1推送和提醒
     CPSettingItem * send = [CPSettingItem itemWithIcon:@"MorePush" title:@"推送和提醒" type:CPSettingItemTypeArrow];
    //2.2摇一摇机选
     CPSettingItem * shake = [CPSettingItem itemWithIcon:@"HandShake" title:@"摇一摇机选" type:CPSettingItemTypeSwitch];
    //2.3声音效果
     CPSettingItem * sound = [CPSettingItem itemWithIcon:@"sound_Effect" title:@"声音效果" type:CPSettingItemTypeSwitch];
    //2.4圈子仅Wifi加载图片
     CPSettingItem * friends = [CPSettingItem itemWithIcon:@"More_QuanZi_NetFlowSwitchImage" title:@"圈子仅Wifi加载图片" type:CPSettingItemTypeSwitch];
    //第三组四个
    //3.1 推荐给朋友
    CPSettingItem * share = [CPSettingItem itemWithIcon:@"MoreShare" title:@"推荐给朋友" type:CPSettingItemTypeArrow];
    //3.2产品推荐
    CPSettingItem * product = [CPSettingItem itemWithIcon:@"MoreNetease" title:@"产品推荐" type:CPSettingItemTypeArrow];
    //3.3服务协议
    CPSettingItem * sever = [CPSettingItem itemWithIcon:@"MoreServiceAgreement" title:@"服务协议" type:CPSettingItemTypeArrow];
    //3.4关于
    CPSettingItem * about = [CPSettingItem itemWithIcon:@"MoreAbout" title:@"关于" type:CPSettingItemTypeArrow];
    
    about.operation = ^{
        UIViewController * vc = [[UIViewController alloc]init];
        vc.title = @"帮助";
        [self.navigationController pushViewController:vc animated:YES];
    };
    _allItems = [NSArray array];
    //添加所有object
    _allItems = @[
                  @[moneyCode],
                  @[send,shake,sound,friends],
                  @[share,product,sever,about]
                  ];
}
#pragma mark - 单元表格数据源方法
/**
 *  返回多少组
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _allItems.count;
}
/**
 *  返回每组多少个元素
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //取出每组对应的个数
    NSArray * array = _allItems[section];
    return array.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"cell";
    //去缓存池中查找对应的cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //如果没有再创建cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //取出这行对应的模型
    CPSettingItem * item = _allItems[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:item.icon];
    cell.textLabel.text = item.title;
    if (item.type == CPSettingItemTypeArrow) {
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }else if (item.type == CPSettingItemTypeSwitch){
        //禁止表格框可点击
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryView = [[UISwitch alloc]init];
    }else{
        /**
         *  注意：这里的清空是因为cell是循环利用的！
         */
        cell.accessoryView = nil;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;

    }
    
    return cell;
}
#pragma mark - 点击cell执行的操作
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出这行对应模型
    CPSettingItem * item = _allItems[indexPath.section][indexPath.row];
    if (item.operation) {
        item.operation();
    }
}
@end
