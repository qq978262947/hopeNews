//
//  WJBaseTool.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/17.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJBaseTool.h"
#import "WJHttpTool.h"
#import <MJExtension.h>

@implementation WJBaseTool
+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param mj_keyValues];
    //    WJLog(@"%@",params);
    [[WJHttpTool sharedHttpTool] get:url params:params success:^(id responseObj) {
        if (success) {
            id result = [resultClass mj_objectWithKeyValues:responseObj];
//            WJLog(@"%@",result);
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)cancelAllOperation{
    [[WJHttpTool sharedHttpTool]cancelAllOperation];
}


@end
