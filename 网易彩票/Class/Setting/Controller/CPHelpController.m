//
//  CPHelpController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/17.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPHelpController.h"
#import "CPHtmlController.h"

@interface CPHelpController ()

{
    NSMutableArray * _htmlPages;
}
@end

@implementation CPHelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载JSON----help.json
    NSURL * url = [[NSBundle mainBundle] URLForResource:@"help.json" withExtension:nil];
    NSData * data = [NSData dataWithContentsOfURL:url];
    NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    //遍历数组
    _htmlPages = [NSMutableArray array];
    NSMutableArray * items = [NSMutableArray array];
    for (NSDictionary * dic in array) {
        //创建网络模型
        CPHtmlPage * page = [CPHtmlPage htmlPageWithDic:dic];
        [_htmlPages addObject:page];
        //每一行的cell
        CPSettingArrow * arrow = [CPSettingArrow itemWithIcon:nil title:page.title];
        [items addObject:arrow];
    }
    //添加数组
    CPSettingGroup * group = [[CPSettingGroup alloc]init];
    group.items = items;
    [_allGroups addObject:group];
    
}
#pragma mark - 重写父类的cell didSelectedRowAtIndexPath方法
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //快速创建一个带导航栏的控制器
    CPHtmlController * htmlVc = [[CPHtmlController alloc]init];
    htmlVc.htmlpage = _htmlPages[indexPath.row];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:htmlVc];
    [self presentViewController:nav animated:YES completion:nil];
}
-(void)dealloc{
    CPLog(@"question---dealloc----");
}
@end
