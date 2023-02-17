//
//  GLAView.m
//  GlComponentBasic_Example
//
//  Created by liyoucheng on 2023/2/1.
//  Copyright © 2023 lyc. All rights reserved.
//

#import "GLAView.h"

#import "GLB1View.h"
#import "GLB2View.h"

@implementation GLAView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(30, 30, 100, 20);
        label.text = @"A";
        [self addSubview:label];
        
        GLB1View *b1View = [GLB1View new];
        b1View.frame = CGRectMake(40, 30 + 20 + 20, 320, 150);
        [self addSubview:b1View];
        
        GLB2View *b2View = [GLB2View new];
        b2View.frame = CGRectMake(40, 30 + 20 + 20 + 150 + 20, 320, 300);
        [self addSubview:b2View];
    }
    return self;
}

@end
