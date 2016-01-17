//
//  CPBaseSettingController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPBaseSettingController.h"
#import "CPSettingItem.h"
#import "CPSettingCell.h"
#import "CPSettingGroup.h"
@interface CPBaseSettingController()<UIAlertViewDelegate>

//{
//    UITableView * _tableView;
//}

@end
@implementation CPBaseSettingController

-(void) loadView{
    UITableView * tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    _tableView = tableView;
    self.view = tableView;
    //[self.view addSubview:tableView];
}
-(void) viewDidLoad{
    [super viewDidLoad];
        _allGroups = [NSMutableArray array];
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}
#pragma mark - 单元表格数据源方法
/**
 *  返回多少组
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _allGroups.count;
}
/**
 *  返回每组多少个元素
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //取出每组对应的个数
    CPSettingGroup * group = _allGroups[section];
    return group.items.count;
}
#pragma mark - 自定义cell
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //去缓存池中查找对应的cell
    CPSettingCell * cell = [CPSettingCell getCellFromTableView:tableView];
//    cell.backgroundView.backgroundColor = [UIColor purpleColor];
//    cell.backgroundColor = [UIColor purpleColor];
    //取出这行对应的模型
    CPSettingGroup * group = _allGroups[indexPath.section];
    CPSettingItem * item = group.items[indexPath.row];
    //放到模型中去处理cell
    cell.item = item;
    return cell;
}
#pragma mark - 点击cell执行的操作
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSelector:@selector(diselected) withObject:nil afterDelay:0.05];
    //取出这行对应模型
    CPSettingGroup * group = _allGroups[indexPath.section];
    CPSettingItem * item = group.items[indexPath.row];
    if (item.operation) {
        item.operation();
        return;
    }
    //跳转到下一个控制器
    if ([item isKindOfClass:[CPSettingArrow class]]) {
        CPSettingArrow * arrowItem = (CPSettingArrow *)item;
        if (arrowItem.showVcClass) {
            UIViewController * vc = [[arrowItem.showVcClass alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
 
    }
}

-(void) diselected{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];

}
#pragma mark - 返回每一组的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CPSettingGroup * group = _allGroups[section];
    //返回组的标题
    return group.header;
}

#pragma mark - 警告框将要显示出来执行的方法
-(void)willPresentAlertView:(UIAlertView *)alertView{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}
@end
