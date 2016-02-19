//
//  WJFriendTrendsRightView.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/16.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJFriendTrendsRightView.h"
#import "WJRightTableViewCell.h"

@interface WJFriendTrendsRightView () <UITableViewDelegate , UITableViewDataSource>


@end

@implementation WJFriendTrendsRightView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupTableView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupTableView];
    }
    return self;
}
/**
 *  初始化tableview
 */
- (void)setupTableView{
    //设置tableview
    self.backgroundColor = WJGlobalBg;
    CGFloat tableViewH = WJScreenH - 64;
    CGFloat tableViewW = WJScreenW-71;
    CGFloat tableViewX = 0;
    CGFloat tableViewY = 0;
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH)];
    [self addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    //设置tableview背景色
    UIView *bgView = [[UIView alloc]initWithFrame:tableView.bounds];
    bgView.backgroundColor = WJGlobalBg;
    [tableView setBackgroundView:bgView];


}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WJRightTableViewCell *cell = [WJRightTableViewCell rightCellWithTableView:tableView];
    cell.user = self.users[indexPath.row];
    return cell;
}

#pragma mark - <tableviewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 74;
}


@end
