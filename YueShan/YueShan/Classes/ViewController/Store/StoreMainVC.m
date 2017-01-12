//
//  StoreMainVC.m
//  YYWeChat
//
//  Created by iosdev on 2017/1/4.
//  Copyright © 2017年 opq. All rights reserved.
//

#import "StoreMainVC.h"
#import "AdScrollView.h"
#import "AdDataModel.h"

#import "StoreCVCell.h"

static NSString *kcellIdentifier = @"StoreCVCell";

@interface StoreMainVC ()<AdScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout> {
    AdScrollView * _scrollView;
    CGFloat bannerHeight;
    
    UICollectionView *collView;
    
    NSInteger edge;
    NSInteger cellWidth;
}

@end

@implementation StoreMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //广告
    bannerHeight = MAIN_SCREEN_HEIGHT*0.284;
    [self.view addSubview:[self createScrollView]];
    //
    edge = 15;
    cellWidth = (MAIN_SCREEN_WIDTH-edge*3)/2;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGRect rect = CGRectMake(0, bannerHeight, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT-bannerHeight-44);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    collView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    collView.backgroundColor = [UIColor whiteColor];
    collView.dataSource=self;
    collView.delegate=self;
    
    [collView registerNib:[UINib nibWithNibName:@"StoreCVCell" bundle:nil] forCellWithReuseIdentifier:kcellIdentifier];
    [self.view addSubview:collView];
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
    _scrollView = [[AdScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, bannerHeight)];
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

- (void)selectedAdScrollViewWithIndex:(NSInteger)index {
    DLog(@"index:%long",index);
}

#pragma mark -CollectionView datasource
//section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
//item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //重用cell
    StoreCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kcellIdentifier forIndexPath:indexPath];
    //赋值
    NSString *imageName = [NSString stringWithFormat:@"product%d",(int)indexPath.row];
    cell.img_icon.image = [UIImage imageNamed:imageName];
//    cell.lb_title.text = imageName;
//    cell.layer.borderColor=[UIColor lightGrayColor].CGColor;
//    cell.layer.borderWidth=0.5;
    return cell;
}

//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(cellWidth, cellWidth*1.4);
}
//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(edge, edge, edge, edge);//分别为上、左、下、右
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
//每个item之间的间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 100;
//}
//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
}
//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
}

@end
