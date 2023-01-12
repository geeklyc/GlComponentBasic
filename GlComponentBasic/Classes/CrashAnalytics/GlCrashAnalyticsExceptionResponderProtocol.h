//
//  GlCrashAnalyticsExceptionResponderProtocol.h
//  GlComponentBasic
//
//  Created by liyoucheng on 2023/1/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GlCrashAnalyticsExceptionResponderProtocol <NSObject>

@optional

/// 异常回调
/// - Parameters:
///   - name: 异常名称
///   - reason: 异常原因
///   - stacks: 异常的堆栈信息
- (void)trackAppCrashedWithName:(NSString *)name reason:(NSString *)reason stacks:(NSArray *)stacks;

/// 异常回调（包装过）
/// - Parameter exceptionInfo: 异常信息
- (void)trackAppCrashedWithExceptionInfo:(NSString *)exceptionInfo;

@end

NS_ASSUME_NONNULL_END
