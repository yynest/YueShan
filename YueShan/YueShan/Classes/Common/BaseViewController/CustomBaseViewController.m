//
//  BaseViewController.m
//  QianShanJYDoctor
//
//  Created by iosdev on 2016/10/17.
//  Copyright © 2016年 QSYJ. All rights reserved.
//

#import "CustomBaseViewController.h"
#import "UIBarButtonItem+MJ.h"
@interface CustomBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CustomBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [UIApplication  sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.interactivePopGestureRecognizer.delegate =  self ;
    NSArray *array = self.navigationController.viewControllers;
    if (array.count>1) {
        [self setNavLeftImage:@"com_nav_back"];
    }
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    if (self.navigationController.viewControllers.count <= 1 ) {
        return false;
    }
    return true;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//页面标题栏
- (void)setNavTitle:(NSString *)naviTitle {
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = naviTitle;
    titleLabel.font = [UIFont systemFontOfSize:20.0f];
    self.navigationItem.titleView = titleLabel;
}
#pragma mark 导航设置
//左边按钮
- (void)setNavLeftImage:(NSString *)NavLeftImage{
    _NavLeftImage = NavLeftImage;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:NavLeftImage highIcon:nil target:self action:@selector(navLeftBut:)];
}

//右边按钮
- (void)setNavRightImage:(NSString *)NavRightImage{
    _NavRightImage = NavRightImage;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:NavRightImage highIcon:nil target:self action:@selector(navRightBut:)];
}
//多个导航左按钮
- (void)setNavLeftImageArray:(NSArray *)NavLeftImageArray{
    _NavLeftImageArray = NavLeftImageArray;
    
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:1];
    
    for (int i = 0; i < NavLeftImageArray.count; i++) {
        NSString *imageName = NavLeftImageArray[i];
        NSInteger itemTag = kMoreNavLeftTag + i;
        UIBarButtonItem *item = [UIBarButtonItem moreItemWithIcon:imageName highIcon:nil target:self action:@selector(moreNavLeftBut:) tag:itemTag];
        item.tag = itemTag;
        [itemArray addObject:item];
    }
    
    self.navigationItem.leftBarButtonItems = itemArray;
}

//多个导航右按钮
- (void)setNavRightImageArray:(NSArray *)NavRightImageArray{
    _NavRightImageArray = NavRightImageArray;
    
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:1];
    
    //NSEnumerationReverse 倒序遍历
    [NavRightImageArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *imageName = NavRightImageArray[idx];
        NSInteger itemTag = kMoreNavRightTag + NavRightImageArray.count - (NavRightImageArray.count - idx);
        UIBarButtonItem *item = [UIBarButtonItem moreItemWithIcon:imageName highIcon:nil target:self action:@selector(moreNavRightBut:) tag:itemTag];
        item.tag = itemTag;
        [itemArray addObject:item];
    }];
    
    self.navigationItem.rightBarButtonItems = itemArray;
}


//导航按钮点击事件
- (void)navLeftBut:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)navRightBut:(UIButton *)sender{}
- (void)moreNavLeftBut:(UIButton *)sender{}
- (void)moreNavRightBut:(UIButton *)sender{}

#pragma mark 触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
//空页面
- (void)addEmptyViewTipsWithType:(EmptyViewType)type {
    if (type == EmptyViewTypeStore ) {
        [emptyViewTips removeFromSuperview];
        emptyViewTips = nil;
    }
    if (!emptyViewTips) {
        emptyViewTips = [[EmptyViewTips alloc]initWithFrame:CGRectMake(MAIN_SCREEN_WIDTH/3, MAIN_SCREEN_HEIGHT/6, MAIN_SCREEN_WIDTH/3, 200)];
        emptyViewTips.type = type;
       
    }
     [self.view addSubview:emptyViewTips];
}
@end
