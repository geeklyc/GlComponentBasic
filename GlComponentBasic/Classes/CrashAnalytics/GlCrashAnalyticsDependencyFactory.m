//
//  GlCrashAnalyticsDependencyFactory.m
//  GlComponentBasic
//
//  Created by liyoucheng on 2023/1/4.
//

#import "GlCrashAnalyticsDependencyFactory.h"
#import "GlCrashAnalyticsExceptionHandler.h"
#import "GlCrashAnalyticsExceptionLogResponder.h"

@implementation GlCrashAnalyticsDependencyFactory

+ (void)createExceptionHandler {
    id<GlCrashAnalyticsExceptionResponderProtocol> responder  = [GlCrashAnalyticsExceptionLogResponder new];
    [GlCrashAnalyticsExceptionHandler sharedInstance].responder = responder;
}

@end
