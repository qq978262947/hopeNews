//
//  WJLeftTableViewCell.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/16.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJLeftTableViewCell.h"
#import "WJUserResult.h"

@interface WJLeftTableViewCell ()
/** 选中时显示的指示器控件 */
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;
/** 类别模型 */
@property (weak, nonatomic) IBOutlet UILabel *categoryTextLabel;

@end

@implementation WJLeftTableViewCell

/**
 *  得到tableview
 *
 *  @param tableView cell所属的tableView
 *
 *  @return 指定tableview的cell
 */
+ (WJLeftTableViewCell *)leftCellWithTableView:(UITableView *)tableView{
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
    self.backgroundColor = WJRGBColor(244, 244, 244);
    //设置指示器的颜色
    self.selectedIndicator.backgroundColor = WJRGBColor(219, 21, 26);
    
}

/**
 * 可以在这个方法中监听cell的选中和取消选中
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    self.selectedIndicator.hidden = !selected;
    self.categoryTextLabel.textColor = selected ? self.selectedIndicator.backgroundColor : WJRGBColor(78, 78, 78);
    [super setSelected:selected animated:animated];
    
}

/**
 *  为cell自控件赋值
 *
 *  @param category NSArray ＊
 */
- (void)setCategory:(WJUserResult *)category{
    _category = category;
    self.categoryTextLabel.text = category.name;
}


@end
