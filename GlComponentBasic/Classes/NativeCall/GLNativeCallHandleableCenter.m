//
//  GLNativeCallHandleableCenter.m
//  GlComponentBasic
//
//  Created by liyoucheng on 2022/12/13.
//

#import "GLNativeCallHandleableCenter.h"

@interface GLNativeCallHandleableCenter ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSDictionary *> *moduleMDict;

@end

@implementation GLNativeCallHandleableCenter

+ (instancetype)shareInstance {
    static GLNativeCallHandleableCenter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[GLNativeCallHandleableCenter alloc] init];
    });
    return instance;
}

- (void)registerModule:(NSString *)moduleName
               methods:(NSDictionary<NSString *, id<GLNativeCallHandleable>> *)methods {
    if (!moduleName || !methods || [methods count] == 0) {
        return;
    }
    
    if (!self.moduleMDict[moduleName]) {
        self.moduleMDict[moduleName] = methods;
        return;
    }
    
    // 合并同模块名下所有方法
    NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:self.moduleMDict[moduleName]];
    for (NSString *key in [methods allKeys]) {
        mDict[key] = methods[key];
    }
    self.moduleMDict = mDict;
}

- (id<GLNativeCallHandleable>)fetchNativeCallHandler:(NSString *)moduleName
                                          methodName:(NSString *)methodName {
    if ([self moduleIsExist:moduleName]) {
        return nil;
    }
    
    NSDictionary *methods = self.moduleMDict[moduleName];
    return methods[methodName];
}

- (BOOL)moduleIsExist:(NSString *)moduleName {
    if (!moduleName) {
        return NO;
    }
    
    if (![[self.moduleMDict allKeys] containsObject:moduleName]) {
        return NO;
    }
    
    NSDictionary *methods = self.moduleMDict[moduleName];
    return [[methods allKeys] count] > 0;
}

- (NSMutableDictionary<NSString *,NSDictionary *> *)moduleMDict {
    if (!_moduleMDict) {
        _moduleMDict = [NSMutableDictionary dictionary];
    }
    return _moduleMDict;
}

@end
