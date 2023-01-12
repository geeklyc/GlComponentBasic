//
//  GLNativeCallHandleableCenter.h
//  GlComponentBasic
//
//  Created by liyoucheng on 2022/12/13.
//

#import <Foundation/Foundation.h>

#import "GLNativeCallHandleable.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLNativeCallHandleableCenter : NSObject

+ (instancetype)shareInstance;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/// 注册模块
/// - Parameters:
///   - moduleName: 模块名
///   - methods: 模块下方法列表
- (void)registerModule:(NSString *)moduleName
               methods:(NSDictionary<NSString *, id<GLNativeCallHandleable>> *)methods;

/// 获取调用者
/// - Parameters:
///   - moduleName: 模块名
///   - methodName: 方法名
- (id<GLNativeCallHandleable>)fetchNativeCallHandler:(NSString *)moduleName
                                          methodName:(NSString *)methodName;

/// 模块是否存在
/// - Parameter moduleName: 模块名
- (BOOL)moduleIsExist:(NSString *)moduleName;

@end

NS_ASSUME_NONNULL_END
