//
//  WJRecommendController.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/16.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJRecommendController.h"

@interface WJRecommendController ()

@end

@implementation WJRecommendController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WJGlobalBg;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"推荐关注";
    
    [self loadMoreCategories];
    
}

- (void)loadMoreCategories{
    
}

- (void)loadMoreUserData{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
