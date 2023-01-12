//
//  GlCrashAnalyticsExceptionHandler.m
//  GlComponentBasic
//
//  Created by liyoucheng on 2023/1/4.
//

#import "GlCrashAnalyticsExceptionHandler.h"

static NSString *const GlCrashAnalyticsExceptionHandlerName = @"GlCrashAnalyticsExceptionHandler";
static NSString *const GlCrashAnalyticsExceptionHandlerUserInfo = @"GlCrashAnalyticsExceptionHandlerUserInfo";

@interface GlCrashAnalyticsExceptionHandler ()

@property (nonatomic) NSUncaughtExceptionHandler *previousExceptionHandler;

@end

@implementation GlCrashAnalyticsExceptionHandler

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static GlCrashAnalyticsExceptionHandler *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [GlCrashAnalyticsExceptionHandler new];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _previousExceptionHandler = NSGetUncaughtExceptionHandler();
        NSSetUncaughtExceptionHandler(&crash_analytics_uncaught_exception_handler);
        
        // 定义信号集结构体
        struct sigaction sig;
        // 将信号集初始化为空
        sigemptyset(&sig.sa_mask);
        // 在回调函数中传入 __siginfo 参数
        sig.sa_flags = SA_SIGINFO;
        // 设置信号集回调处理函数
        sig.sa_sigaction = &crash_analytics_signal_uncaught_exception_handler;
        // 定义需要采集的信号类型
        int signals[] = { SIGILL, SIGABRT, SIGBUS, SIGFPE, SIGSEGV };
        for (int i = 0; i < sizeof(signals) / sizeof(int); i++) {
            // 注册信号回调
            int err = sigaction(signals[i], &sig, NULL);
            if (err) {
                NSLog(@"【奔溃】注册信号错误 %d", signals[i]);
            }
        }
    }
    return self;
}

// NSException 异常回调
static void crash_analytics_uncaught_exception_handler(NSException *exception) {
    NSLog(@"【奔溃】NSException 异常回调");
    
    [[GlCrashAnalyticsExceptionHandler sharedInstance] trackAppCrashedWithException:exception];
    
    NSUncaughtExceptionHandler *handler = [GlCrashAnalyticsExceptionHandler sharedInstance].previousExceptionHandler;
    if (handler) {
        handler(exception);
    }
}

// Unix 信号异常回调
static void crash_analytics_signal_uncaught_exception_handler(int sig, struct __siginfo *info, void *context) {
    NSLog(@"【奔溃】Unix 信号异常回调");
    
    NSDictionary *userInfo = @{
        GlCrashAnalyticsExceptionHandlerUserInfo: @(sig)
    };
    NSString *reason = [NSString stringWithFormat:@"Signal %d was raised", sig];
    
    // 创建一个异常对象，用于采集奔溃信息数据
    NSException *exception = [NSException exceptionWithName:GlCrashAnalyticsExceptionHandlerName reason:reason userInfo:userInfo];
    [[GlCrashAnalyticsExceptionHandler sharedInstance] trackAppCrashedWithException:exception];
}

- (void)trackAppCrashedWithException:(NSException *)exception {
    // 异常名称
    NSString *name = [exception name];
    // 异常原因
    NSString *reason = [exception reason];
    // 异常的堆栈信息
    NSArray *stacks = [exception callStackSymbols] ?: [NSThread callStackSymbols];
    // 组装异常信息
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception Name: %@\nException Reason: %@\nException Stack: %@", name, reason, stacks];
    
    if (self.responder) {
        if ([self.responder respondsToSelector:@selector(trackAppCrashedWithName:reason:stacks:)]) {
            [self.responder trackAppCrashedWithName:name reason:reason stacks:stacks];
        }
        
        if ([self.responder respondsToSelector:@selector(trackAppCrashedWithExceptionInfo:)]) {
            [self.responder trackAppCrashedWithExceptionInfo:exceptionInfo];
        }
    }
    
    NSSetUncaughtExceptionHandler(NULL);
    
    int signals[] = { SIGILL, SIGABRT, SIGBUS, SIGFPE, SIGSEGV };
    for (int i = 0; i < sizeof(signals) / sizeof(int); i++) {
        signal(signals[i], SIG_DFL);
    }
}

@end
