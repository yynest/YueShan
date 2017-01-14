//
//  MeMainVC.m
//  YYWeChat
//
//  Created by iosdev on 2017/1/4.
//  Copyright © 2017年 opq. All rights reserved.
//

#import "MeMainVC.h"
#import "ExchangeVC.h"
#import "AboutVC.h"
#import "AddressListTVC.h"

@interface MeMainVC () {
    NSArray *values;
}

@end

#define HEADER_HEIGHT 100

@implementation MeMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //第一行：积分，返现，邀请码
    //电话，我的地址，版本，关于
    NSArray *titles = @[@[@"积分",@"返现",@"邀请码"],@[@"兑换券",@"收货地址",@"客服电话",@"版本",@"关于"]];
    values = @[@"1000",@"¥ 15.5",@"yqm123"];
    [dataList addObjectsFromArray:titles];
    
    [baseTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger row = 1;
    if (section == 1) {
        NSArray *temp = dataList[section];
        row = temp.count;
    }
    return row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strCell = @"strCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = [UIColor colorTextBlack];
        cell.textLabel.shadowColor = [UIColor clearColor];
        ;
        cell.detailTextLabel.textColor = [UIColor colorTextGragLight];
    }
    NSInteger row = indexPath.row;
    NSInteger sec = indexPath.section;
    NSArray *temp = dataList[sec];
    
    if (sec == 0) {
        for (int i=0; i<temp.count; i++) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            NSInteger width = (MAIN_SCREEN_WIDTH-EDGE_VIEW*2)/temp.count;
            //第一行：积分，返现，邀请码
            UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_VIEW+width*i, EDGE_VIEW, width, 30)];
            lb1.text = temp[i];
            lb1.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:lb1];
            CGRect rect = lb1.frame;
            //值
            UILabel *lb2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetWidth(rect), 30)];
            lb2.text = values[i];
            lb2.textColor = [UIColor brownColor];
            lb2.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:lb2];
        }
    }
    else {
        //电话，我的地址，版本，关于
        cell.textLabel.text = temp[row];
        if (row == 2) {
            cell.detailTextLabel.text = @"18569039857";
        }
        else if (row == 4) {
            cell.detailTextLabel.text = @"1.0";
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = nil;
    if (section == 0) {
        headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, HEADER_HEIGHT)];
//        headView.backgroundColor = [UIColor blueColor];
        //头像
        CGFloat width = HEADER_HEIGHT - EDGE_VIEW*2;
        UIButton *btHead = [[UIButton alloc] initWithFrame:CGRectMake(EDGE_VIEW, EDGE_VIEW, width, width)];
        [btHead setBackgroundImage:[UIImage imageNamed:@"product0"] forState:UIControlStateNormal];
        [headView addSubview:btHead];
        CGRect rectHead = btHead.frame;
        //昵称
        UILabel *lb_nickname = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(rectHead)+EDGE_VIEW_ELEMENT, EDGE_VIEW, 200, 30)];
        lb_nickname.text = @"我的姓名";
        [headView addSubview:lb_nickname];
        CGRect rectNickname = lb_nickname.frame;
        //会员号
        UILabel *lb_card = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(rectNickname), HEADER_HEIGHT-EDGE_VIEW-30, 200, 30)];
        lb_card.text = @"会员号：00001";
        [headView addSubview:lb_card];
    }
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height;
    if (indexPath.section == 0) {
        height = 80;
    }
    else {
        height = 60;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height = 1;
    if (section == 0) {
        height = HEADER_HEIGHT;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger sec = indexPath.section;
    NSInteger row = indexPath.row;
    if (sec == 1) {
        switch (row) {
            case 0: {
                [self.navigationController pushViewController:[[ExchangeVC alloc] init] animated:YES];
            }
                break;
            case 1: {
                [self.navigationController pushViewController:[[AddressListTVC alloc] init] animated:YES];
            }
                break;
            case 2: {
                NSString * str=[[NSString alloc] initWithFormat:@"telprompt://%@",@"18569039857"];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
            }
                break;
            case 3: {
                [self.navigationController pushViewController:[[AboutVC alloc] init] animated:YES];
            }
                break;
            case 4: {
                
            }
                break;
            case 5: {
                
            }
                break;

            default:
                break;
        }
    }
}

@end
