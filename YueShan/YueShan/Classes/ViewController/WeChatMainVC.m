//
//  WeChatMainVC.m
//  YYWeChat
//
//  Created by iosdev on 2017/1/4.
//  Copyright © 2017年 opq. All rights reserved.
//

#import "WeChatMainVC.h"
#import "AdScrollView.h"
#import "AdDataModel.h"

@interface WeChatMainVC () {
    
    AdScrollView * _scrollView;
    
    CGFloat    _bannerHeight;
}

@end

@implementation WeChatMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bannerHeight = [UIScreen mainScreen].bounds.size.height*0.284;
    
    [self.view addSubview:[self createScrollView]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 构建广告滚动视图
- (UIScrollView*)createScrollView {
    if (_scrollView) {
        return _scrollView;
    }
    _scrollView = [[AdScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _bannerHeight)];
    AdDataModel * dataModel = [AdDataModel adDataModelWithImageNameAndAdTitleArray];
    //如果滚动视图的父视图由导航控制器控制,必须要设置该属性(ps,猜测这是为了正常显示,导航控制器内部设置了UIEdgeInsetsMake(64, 0, 0, 0))
    //scrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    
    _scrollView.imageNameArray = dataModel.imageNameArray;
    //隐藏page  controller
    //scrollView.PageControlShowStyle = UIPageControlShowStyleRight;
    //scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //scrollView.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    
    //隐藏title laber
    [_scrollView setAdTitleArray:dataModel.adTitleArray withShowStyle:AdTitleShowStyleLeft];
    
    return _scrollView;
}

@end
