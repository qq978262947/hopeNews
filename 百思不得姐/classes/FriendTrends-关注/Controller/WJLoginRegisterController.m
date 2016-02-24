//
//  WJLoginRegisterController.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/21.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJLoginRegisterController.h"

@interface WJLoginRegisterController ()
/** 登录框距离控制器view左边的间距 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeftMargin;
@end

@implementation WJLoginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)closeLoginRegister:(id)sender {
    //关闭登录/注册界面
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showLoginOrRegister:(UIButton *)button {
    // 退出键盘
    [self.view endEditing:YES];
    // 切换 登录/注册
    self.loginViewLeftMargin.constant = (button.selected = !button.selected) ? - self.view.width : 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

/**
 * 让当前控制器对应的状态栏是白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
