//
//  WJTextField.m
//  01-百思不得姐
//
//  Created by xiaomage on 15/7/26.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "WJTextField.h"
#import <objc/runtime.h>

static NSString * const WJPlacerholderColorKeyPath = @"_placeholderLabel.textColor";
static NSString * const WJClearButtonColorKeyPath = @"_clearButton";

@interface WJTextField ()
@property (strong, nonatomic)UIImage *image;
@end


@implementation WJTextField

+ (void)initialize
{
//    [self getIvars];

}


- (void)awakeFromNib
{
    // 设置光标颜色和文字颜色一致
    self.tintColor = self.textColor;
    
    // 不成为第一响应者
    [self resignFirstResponder];
}

/**
 * 当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder
{
    // 修改占位文字颜色
    [self setValue:self.textColor forKeyPath:WJPlacerholderColorKeyPath];
    // 修改占位文字颜色
    UIButton *btn = [self valueForKey:WJClearButtonColorKeyPath];
    self.image = btn.imageView.image;
    [btn setImage:[UIImage imageNamed:@"login_close_icon"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"login_close_icon"] forState:UIControlStateHighlighted];
    return [super becomeFirstResponder];
}

/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder
{
    // 修改占位文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:WJPlacerholderColorKeyPath];
    // 修改占位文字颜色
    UIButton *btn = [self valueForKey:WJClearButtonColorKeyPath];
    [btn setImage:self.image forState:UIControlStateNormal];
    [btn setImage:self.image forState:UIControlStateHighlighted];
    return [super resignFirstResponder];
}

+ (void)getIvars
{
    unsigned int count = 0;
    
    // 拷贝出所有的成员变量列表
    Ivar *ivars = class_copyIvarList([UIImageView class], &count);
    
    for (int i = 0; i<count; i++) {
        // 取出成员变量
        //        Ivar ivar = *(ivars + i);
        Ivar ivar = ivars[i];
        
        // 打印成员变量名字
        WJLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    
    // 释放
    free(ivars);
}

/**
 运行时(Runtime): 
 * 苹果官方一套C语言库
 * 能做很多底层操作(比如访问隐藏的一些成员变量\成员方法....)
 */

@end
