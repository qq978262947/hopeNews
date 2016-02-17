//
//  WJLeftTableViewCell.h
//  百思不得姐
//
//  Created by 汪俊 on 16/2/16.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJRecommendController,WJUserResult;

@interface WJLeftTableViewCell : UITableViewCell

/**
 *  得到tableview
 *
 *  @param tableView cell所属的tableView
 *
 *  @return 指定tableview的cell
 */
+ (WJLeftTableViewCell *)leftCellWithTableView:(UITableView *)tableView;


/** 类别模型 */
@property (nonatomic, strong) WJUserResult *category;

@end
