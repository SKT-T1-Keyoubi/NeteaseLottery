//
//  CPProductController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/17.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPProductController.h"
#import "CPProduct.h"
#import "CPProductCell.h"
#define CPID @"cell"
@interface CPProductController ()

{
    NSMutableArray * _productItems;
}
@end

@implementation CPProductController

-(id)init{
    UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake(80, 80);
    flow.minimumLineSpacing = 40;
    //调整section的间距
    flow.sectionInset = UIEdgeInsetsMake(40, 10, 0, 10);
    return [self initWithCollectionViewLayout:flow];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品推荐";
    //加载JSON数据
    NSURL * url = [[NSBundle mainBundle] URLForResource:@"product.json" withExtension:nil];
    NSData * data = [NSData dataWithContentsOfURL:url];
    NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    //创建产品模型
    _productItems = [NSMutableArray array];
    for (NSDictionary * dic in array) {
        CPProduct * product = [CPProduct productWithDict:dic];
        [_productItems addObject:product];
        //CPLog(@"aaaa");
    }
    //注册
    UINib * nib = [UINib nibWithNibName:@"CPProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:CPID];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _productItems.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CPProductCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CPID forIndexPath:indexPath];
#warning 图标的背景图片设置！
    cell.product = _productItems[indexPath.item];
    return cell;
}
@end
