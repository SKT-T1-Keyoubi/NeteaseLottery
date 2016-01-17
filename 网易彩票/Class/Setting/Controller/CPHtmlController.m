//
//  CPHtmlController.m
//  网易彩票
//
//  Created by LoveQiuYi on 16/1/17.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CPHtmlController.h"

@interface CPHtmlController ()<UIWebViewDelegate>
{
    UIWebView * _webView;
}
@end

@implementation CPHtmlController

-(void)loadView{
    _webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置标题
    self.title = _htmlpage.title;
    //设置内容
    NSURL * url = [[NSBundle mainBundle] URLForResource:_htmlpage.html withExtension:nil];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    //设置左边关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered target:self action:@selector(close)];
    _webView.delegate = self;
    
}
#pragma mark - close方法
-(void) close{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)dealloc{
    CPLog(@"html dealloc");
}
#pragma mark - 任何js代码只能在这个方法中去执行
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    //网页内部标题的跳转
    NSString * str = [NSString stringWithFormat:@"window.location.href = '#%@';",_htmlpage.htmlId];
    [webView stringByEvaluatingJavaScriptFromString:str];
}

@end
