//
//  WJEssenceViewController.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/16.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJEssenceController.h"
#import "WJContainerView.h"

@interface WJEssenceController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) WJContainerView *containerView;
@end

@implementation WJEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupContainerView];
    
}

- (void)setupContainerView{
    WJContainerView *containerView = [WJContainerView containerView];
    self.containerView = containerView;
    containerView.titles = @[@"段子",@"图片",@"视频",@"声音",@"全部"];
    [self.view addSubview:containerView];
    [self configContainerView];
    [containerView setBackgroundColor:[UIColor whiteColor]];
    containerView.buttonBackgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
    containerView.indicatorViewColor = [UIColor redColor];
    
}

- (void)configContainerView{
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
