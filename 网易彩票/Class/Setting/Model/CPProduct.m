//
//  CPProduct.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/17.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPProduct.h"

@implementation CPProduct

+(id) productWithDict:(NSDictionary *) dic{
    CPProduct * product = [[self alloc]init];
    product.title = dic[@"title"];
    product.icon = dic[@"icon"];
    return product;
}

@end
