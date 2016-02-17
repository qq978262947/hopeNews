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

@property (nonatomic,weak)UITableView *tableView;

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
    self.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.bounds];
    [self addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    self.categories[indexPath.row];
    cell.textLabel.text = self.categories[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
