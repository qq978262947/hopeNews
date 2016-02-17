//
//  WJRecommendController.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/16.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJRecommendController.h"
#import "WJCategoryParam.h"
#import "WJCategoryTool.h"
#import "WJUserResult.h"
#import "WJFriendTrendsLeftView.h"
#import "WJFriendTrendsRightView.h"
#import <MJRefresh.h>
#import <SVProgressHUD.h>

#define WJSelectedCategory self.leftView.categories[self.rightView.tableView.indexPathForSelectedRow.row]

@interface WJRecommendController () <WJFriendTrendsLeftViewDelegate>
/**
 *  左边分类信息的视图
 */
@property (weak, nonatomic) IBOutlet WJFriendTrendsLeftView *leftView;
/**
 *  右边用户数据的视图
 */
@property (weak, nonatomic) IBOutlet WJFriendTrendsRightView *rightView;

@end

@implementation WJRecommendController


- (void)viewDidLoad {
    [super viewDidLoad];
    //对当前视图进行集成
    [self setupRecommendView];
    //集成刷新控件
    [self setupRefresh];
    //加载分类数据
    [self loadMoreCategories];
    
}

/**
 * 控件初始化
 */
- (void)setupRecommendView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    self.leftView.delegate = self;
//    self.rightView.delegate = self;
}

/**
 * 添加刷新控件
 */
- (void)setupRefresh
{
    self.rightView.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUserData)];
    
    self.rightView.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    self.rightView.tableView.mj_footer.hidden = YES;
}

/**
 *  加载左侧的分类信息
 */
- (void)loadMoreCategories{
    // 显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    //发送请求
    WJCategoryParam *categoryParams = [[WJCategoryParam alloc]init];
    categoryParams.a = @"category";
    categoryParams.c = @"subscribe";
    [WJCategoryResult mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"list" : [WJUserResult class]
                 };
    }];
    [WJCategoryTool FriendsTrendsStatusesWithParam:categoryParams success:^(WJCategoryResult *result) {
        // 隐藏指示器
        [SVProgressHUD dismiss];
         self.leftView.categories = result.list;
    } failure:^(NSError *error) {
        // 显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}

/**
 *  加载右侧的最新用户数据
 */
- (void)loadNewUserData{

}
/**
 *  加载右侧的更多用户数据
 */
- (void)loadMoreUsers{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  点击了左侧friendsLeftView中tableview的哪一行
 *
 */
- (void)friendsLeftView:(WJFriendTrendsLeftView *)leftView didClickIndex:(NSInteger)index{
    // 结束刷新
    
}

@end
