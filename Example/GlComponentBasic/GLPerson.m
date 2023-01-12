//
//  GLPerson.m
//  GlComponentBasic_Example
//
//  Created by liyoucheng on 2023/1/5.
//  Copyright © 2023 lyc. All rights reserved.
//

#import "GLPerson.h"

@implementation GLPerson

- (instancetype)init
{
    self = [super init];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"执行定时");
        }];
    }
    return self;
}

@end
