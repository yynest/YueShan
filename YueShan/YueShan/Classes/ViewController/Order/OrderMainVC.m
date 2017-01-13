//
//  DiscoverMainVC.m
//  YYWeChat
//
//  Created by iosdev on 2017/1/4.
//  Copyright © 2017年 opq. All rights reserved.
//

#import "OrderMainVC.h"
#import "OrderTVC.h"

@interface OrderMainVC ()

@end

@implementation OrderMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titles = @[@"我的订单1",@"我的订单2",@"我的订单3",@"我的订单1",@"我的订单2",@"我的订单3",@"我的订单1",@"我的订单2",@"我的订单3"];
    [dataList addObjectsFromArray:titles];
    
    [baseTableView reloadData];
    
    [self addMJRefreshHeader];
    [self addMJRefreshFooter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strCell = @"OrderCell";
    OrderTVC *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"OrderTVC" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
//        cell = [[OrderTVC alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.textLabel.textColor = [UIColor colorTextBlack];
//        cell.textLabel.shadowColor = [UIColor clearColor];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;        
//        cell.detailTextLabel.textColor = [UIColor colorTextGragLight];
    }
    NSInteger row = indexPath.row;
//    cell.textLabel.text = dataList[row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

@end
