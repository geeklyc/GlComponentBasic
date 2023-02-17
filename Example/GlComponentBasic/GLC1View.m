//
//  GLC1View.m
//  GlComponentBasic_Example
//
//  Created by liyoucheng on 2023/2/1.
//  Copyright © 2023 lyc. All rights reserved.
//

#import "GLC1View.h"

#import "GLDView.h"

@implementation GLC1View

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(10, 10, 100, 20);
        label.text = @"C1";
        [self addSubview:label];
        
        GLDView *dView = [GLDView new];
        dView.frame = CGRectMake(40 + 50, 30, 100, 50);
        [self addSubview:dView];
    }
    return self;
}

@end
