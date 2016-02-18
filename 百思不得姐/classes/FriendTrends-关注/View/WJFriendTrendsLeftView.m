//
//  WJFriendTrendsLeftView.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/16.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJFriendTrendsLeftView.h"
#import "WJLeftTableViewCell.h"

@interface WJFriendTrendsLeftView () <UITableViewDelegate , UITableViewDataSource>



@end

@implementation WJFriendTrendsLeftView

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
    WJLog(@"%f:::%f",self.width,WJScreenH);
    self.backgroundColor = [UIColor yellowColor];
    CGFloat tableViewH = WJScreenH - 64;
    CGFloat tableViewW = self.width;
    CGFloat tableViewX = 0;
    CGFloat tableViewY = 0;
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH)];
    [self addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    //设置背景颜色
    UIView *bgView = [[UIView alloc]initWithFrame:tableView.bounds];
    bgView.backgroundColor = WJRGBColor(244, 244, 244);;
    [tableView setBackgroundView:bgView];
    
    
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WJLeftTableViewCell *cell = [WJLeftTableViewCell leftCellWithTableView:tableView];
    cell.category = self.categories[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(friendsLeftView:didClickIndex:)]) {
        [self.delegate friendsLeftView:self didClickIndex:indexPath.row];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (void)setCategories:(NSArray *)categories{
    _categories = categories;
    [self.tableView reloadData];
}


@end
