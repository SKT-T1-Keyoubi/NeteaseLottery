//
//  CPAboutController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/16.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPAboutController.h"
@interface CPAboutController()
@property (nonatomic,copy) NSMutableArray * allGroups;
@end
@implementation CPAboutController

-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 

}

-(void)viewDidLoad{
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UITableView * tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    //tableView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:tableView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"关于";
    //tableView.delegate = self;
    tableView.dataSource =self;
    _allGroups = [NSMutableArray array];


}
#pragma mark - tableView的数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"评分支持";
    }else{
        cell.textLabel.text = @"客服电话";
    }
    
    
    return cell;
}
@end
