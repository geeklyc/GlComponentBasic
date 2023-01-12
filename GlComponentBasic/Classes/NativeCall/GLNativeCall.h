//
//  GLNativeCall.h
//  GlComponentBasic
//
//  Created by liyoucheng on 2022/12/13.
//

#import <Foundation/Foundation.h>

#import "GLNativeCallHandleable.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLNativeCall : NSObject

/// 调用原生服务
/// - Parameters:
///   - json: 请求参数
///   - source: 调用来源
///   - processBlock: 调用过程回调
///   - completionBlock: 调用完成回调
- (void)start:(NSString *)json
       source:(GLNativeCallSource)source
 processBlock:(void(^)(NSString *processJson))processBlock
    completed:(void(^)(NSString *resJson))completionBlock;

@end

NS_ASSUME_NONNULL_END
