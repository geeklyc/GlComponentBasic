//
//  GlCrashAnalyticsExceptionLogResponder.m
//  GlComponentBasic
//
//  Created by liyoucheng on 2023/1/4.
//

#import "GlCrashAnalyticsExceptionLogResponder.h"

@implementation GlCrashAnalyticsExceptionLogResponder

// MARK: - GlCrashAnalyticsExceptionResponderProtocol

- (void)trackAppCrashedWithExceptionInfo:(NSString *)exceptionInfo {
    NSLog(@"【奔溃】异常信息 \n%@", exceptionInfo);
}

@end
