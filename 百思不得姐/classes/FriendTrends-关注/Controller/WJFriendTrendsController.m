//
//  WJFriendTrendsController.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/16.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJFriendTrendsController.h"
#import "WJRecommendController.h"

@interface WJFriendTrendsController ()

@end

@implementation WJFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavgationBar];
}

/**
 *  设置导航栏
 */
- (void)setupNavgationBar{
    self.view.backgroundColor = WJGlobalBg;
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]init];
    leftBtn.image = [UIImage imageNamed:@"cellFollowClickIcon"];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"cellFollowClickIcon" highImage:@"cellFollowDisableIcon" target:self action:@selector(friendsClick)];
}

- (void)friendsClick
{
    WJRecommendController *vc = [[WJRecommendController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
