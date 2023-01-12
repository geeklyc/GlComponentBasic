//
//  GlCrashAnalyticsExceptionHandler.h
//  GlComponentBasic
//
//  Created by liyoucheng on 2023/1/4.
//

#import <Foundation/Foundation.h>
#import "GlCrashAnalyticsExceptionResponderProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface GlCrashAnalyticsExceptionHandler : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong, nullable) id<GlCrashAnalyticsExceptionResponderProtocol> responder;

@end

NS_ASSUME_NONNULL_END
