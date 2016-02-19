//
//  WJCategoryTool.h
//  百思不得姐
//
//  Created by 汪俊 on 16/2/17.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJBaseTool.h"
#import "WJCategoryParam.h"
#import "WJCategoryResult.h"
#import "WJUserResult.h"

@interface WJCategoryTool : WJBaseTool

+ (void)FriendsTrendsStatusesWithParam:(WJCategoryParam *)param success:(void (^)(WJCategoryResult *result))success failure:(void (^)(NSError *error))failure;

+ (void)FriendsTrendsUsersWithParam:(WJCategoryParam *)param success:(void (^)(WJUserResult *result))success failure:(void (^)(NSError *error))failure;


@end
