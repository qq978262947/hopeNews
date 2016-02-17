//
//  WJCategoryTool.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/17.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJCategoryTool.h"


@implementation WJCategoryTool

+ (void)FriendsTrendsStatusesWithParam:(WJCategoryParam *)param success:(void (^)(WJCategoryResult *result))success failure:(void (^)(NSError *error))failure{
    [self getWithUrl:@"http://api.budejie.com/api/api_open.php" param:param resultClass:[WJCategoryResult class] success:success failure:failure];
}

@end
