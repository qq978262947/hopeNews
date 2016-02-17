//
//  WJCategoryResult.h
//  百思不得姐
//
//  Created by 汪俊 on 16/2/17.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJCategoryResult : NSObject
/**总数*/
@property (strong,nonatomic)NSNumber *total;
/**存放数据的数组*/
@property (strong,nonatomic)NSArray *list;

@end
