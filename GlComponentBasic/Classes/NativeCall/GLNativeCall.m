//
//  GLNativeCall.m
//  GlComponentBasic
//
//  Created by liyoucheng on 2022/12/13.
//

#import "GLNativeCall.h"

#import "MJExtension.h"

@implementation GLNativeCall

- (void)start:(NSString *)json
       source:(GLNativeCallSource)source
 processBlock:(void(^)(NSString *processJson))processBlock
    completed:(void(^)(NSString *resJson))completionBlock {
    if (!json) {
        NSAssert(YES, @"参数不能为空");
        return;
    }
    
    NSDictionary *params = [json mj_JSONObject];
    // 检测模块
    NSString *moduleName = params[@"moduleName"];
}

- (void)handleResult:(GLNativeCallStatus)status
                 msg:(NSString *)msg
                data:(NSDictionary *)data
           completed:(void(^)(NSString *resJson))completionBlock {
    if (!completionBlock) {
        return;
    }
    
    NSDictionary *res = @{
        @"code": [NSString stringWithFormat:@"%@", @(status)],
        @"msg": msg ? msg : @"",
        @"data": data ? data : @{}
    };
    
    completionBlock([res mj_JSONString]);
}

@end
