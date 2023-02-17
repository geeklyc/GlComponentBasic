//
//  GLDView.m
//  GlComponentBasic_Example
//
//  Created by liyoucheng on 2023/2/1.
//  Copyright © 2023 lyc. All rights reserved.
//

#import "GLDView.h"

@implementation GLDView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(10, 10, 100, 20);
        label.text = @"D";
        [self addSubview:label];
    }
    return self;
}

@end
