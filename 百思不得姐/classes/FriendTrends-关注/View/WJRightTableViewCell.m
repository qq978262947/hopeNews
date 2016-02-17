//
//  WJFriendsRightView.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/17.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJRightTableViewCell.h"

@implementation WJRightTableViewCell
/**
 *  得到tableview
 *
 *  @param tableView cell所属的tableView
 *
 *  @return 指定tableview的cell
 */
+ (WJRightTableViewCell *)rightCellWithTableView:(UITableView *)tableView{
    NSString * className = NSStringFromClass([self class]);
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:className];
    return [tableView dequeueReusableCellWithIdentifier:className];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupTableViewCell];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupTableViewCell];
    }
    return self;
}

/**
 *  初始化cell
 */
- (void)setupTableViewCell{
    //设置cell的背景色
    self.backgroundColor = WJGlobalBg;
}

/**
 * 可以在这个方法中监听cell的选中和取消选中
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}



@end
