//
//  WJFriendTrendsLeftView.h
//  百思不得姐
//
//  Created by 汪俊 on 16/2/16.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJFriendTrendsLeftView;

@protocol WJFriendTrendsLeftViewDelegate <NSObject>
/**
 *  点击了左侧的哪一行
 *
 *  @param leftView 左边的view
 *  @param index    tableview的行数
 */
- (void)friendsLeftView:(WJFriendTrendsLeftView *)leftView didClickIndex:(NSInteger)index;

@end

@interface WJFriendTrendsLeftView : UIView

/** 左边的类别数据 */
@property (strong ,nonatomic) NSArray *categories;
/**WJFriendTrendsLeftView的代理*/
@property (weak ,nonatomic)id<WJFriendTrendsLeftViewDelegate> delegate;

@end
