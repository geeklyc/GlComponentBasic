//
//  GLNativeCallHandleable.h
//  GlComponentBasic
//
//  Created by liyoucheng on 2022/12/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 调用状态
typedef NS_ENUM(NSUInteger, GLNativeCallStatus) {
    GLNativeCallStatusSuccess = 0,
    GLNativeCallStatusFailure = 404,
    GLNativeCallStatusModuleError = 409,
    GLNativeCallStatusMethodError = 410,
    GLNativeCallStatusVersionError = 411
};

/// 调用方法类型
typedef NS_ENUM(NSUInteger, GLNativeCallMethodType) {
    GLNativeCallMethodTypeCommon = 0,
    GLNativeCallMethodTypeH5,
    GLNativeCallMethodTypeRN,
};

/// 调用调用来源
typedef NS_ENUM(NSUInteger, GLNativeCallSource) {
    GLNativeCallSourceH5,
    GLNativeCallSourceRN,
};

/// 调用过程回调块
typedef void(^GLNativeCallProcessBlock)(NSString *callbackName, NSDictionary *info);

/// 调用完成回调块
typedef void(^GLNativeCallCompletionBlock)(NSError *error, NSDictionary *res);

@protocol GLNativeCallHandleable <NSObject>

- (GLNativeCallMethodType)methodType;
- (void)start:(NSDictionary *)params processBlock:(GLNativeCallProcessBlock)processBlock completed:(GLNativeCallCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
