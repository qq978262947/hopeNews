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
#import "WJCategoryData.h"
#import "WJFriendTrendsLeftView.h"
#import "WJFriendTrendsRightView.h"
#import <MJRefresh.h>
#import <SVProgressHUD.h>
#import "WJRecommendUser.h"

#define WJSelectedCategory self.leftView.categories[self.index]

@interface WJRecommendController () <WJFriendTrendsLeftViewDelegate>
/**
 *  左边分类信息的视图
 */
@property (weak, nonatomic) IBOutlet WJFriendTrendsLeftView *leftView;
/**
 *  右边用户数据的视图
 */
@property (weak, nonatomic) IBOutlet WJFriendTrendsRightView *rightView;
/**
 *  保存用户当前点击的行数
 */
@property (assign, nonatomic)long index;
/**
 *  保存用户当前全球参数
 */
@property (strong, nonatomic)WJCategoryParam *categoryParams;

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
//    [MJRefreshBackGifFooter];
    self.rightView.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
//    self.rightView.tableView.mj_footer.hidden = YES;
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
                 @"list" : [WJCategoryData class]
                 };
    }];
    [WJCategoryTool FriendsTrendsStatusesWithParam:categoryParams success:^(WJCategoryResult *result) {
        // 隐藏指示器
        [SVProgressHUD dismiss];
        // weitableview赋值
        self.leftView.categories = result.list;
        // 默认选中首行
        [self.leftView.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        [self loadNewUserData];
        
    } failure:^(NSError *error) {
        // 显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}

/**
 *  加载右侧的最新用户数据
 */
- (void)loadNewUserData{
    
    WJCategoryData *categoryData = WJSelectedCategory;
    categoryData.currentPage = 1;
    [self loadUsersWithCategoryData:categoryData];
    
}
/**
 *  加载右侧的更多用户数据
 */
- (void)loadMoreUsers{
    WJCategoryData *categoryData = WJSelectedCategory;
    categoryData.currentPage ++;
    [self loadUsersWithCategoryData:categoryData];
}
//加载最新数据
- (void)loadUsersWithCategoryData:(WJCategoryData *)categoryData{

    WJCategoryData *cd = WJSelectedCategory;
    //发送请求
    WJCategoryParam *categoryParams = [[WJCategoryParam alloc]init];
    categoryParams.a = @"list";
    categoryParams.c = @"subscribe";
    categoryParams.category_id = @(categoryData.id);
    categoryParams.page = @(categoryData.currentPage);
    self.categoryParams = categoryParams;
    [WJUserResult mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"list" : [WJRecommendUser class]
                 };
    }];
        
    [WJCategoryTool FriendsTrendsUsersWithParam:categoryParams success:^(WJUserResult *result) {
//        [self.rightView.tableView.mj_header endRefreshing];
        if (1 == categoryData.currentPage) {
            cd.total = [result.total integerValue];
            [self.rightView.tableView.mj_header endRefreshing];
            [self.rightView.users removeAllObjects];
        }
        // weitableview赋值
        [self.rightView.users addObjectsFromArray:result.list];
        cd.users = self.rightView.users;
        
        if (self.categoryParams != categoryParams) return;

        [self checkFooterState];
        [self.rightView.tableView reloadData];

    } failure:^(NSError *error) {
        // 显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}


/**
 * 时刻监测footer的状态
 */
- (void)checkFooterState
{
     WJCategoryData *cd = WJSelectedCategory;
    // 每次刷新右边数据时, 都控制footer显示或者隐藏
    self.rightView.tableView.mj_footer.hidden = (cd.users.count == 0);
    // 让底部控件结束刷新
    if (cd.users.count == cd.total) { // 全部数据已经加载完毕
        [self.rightView.tableView.mj_footer endRefreshingWithNoMoreData];
    } else { // 还没有加载完毕
        [self.rightView.tableView.mj_footer endRefreshing];
    }
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
    //结束刷新
    [self.rightView.tableView.mj_header endRefreshing];
    [self.rightView.tableView.mj_footer endRefreshing];
    self.index = index;
    [self.rightView.users removeAllObjects];
    [self.rightView.tableView reloadData];
    WJCategoryData *categoryData = self.leftView.categories[index];
    if (categoryData.users.count) {
        [self.rightView.users addObjectsFromArray:categoryData.users];
        [self.rightView.tableView reloadData];
        return;
    }else{
        // 开始刷新数据
        [self.rightView.tableView.mj_header beginRefreshing];
    }

}

@end
