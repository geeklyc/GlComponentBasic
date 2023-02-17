//
//  GLB2View.m
//  GlComponentBasic_Example
//
//  Created by liyoucheng on 2023/2/1.
//  Copyright © 2023 lyc. All rights reserved.
//

#import "GLB2View.h"

#import "GLC1View.h"
#import "GLC2View.h"

@implementation GLB2View

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(10, 10, 100, 20);
        label.text = @"B2";
        [self addSubview:label];
        
        GLC1View *c1View = [GLC1View new];
        c1View.frame = CGRectMake(40, 30 + 20 + 20, 200, 150);
        [self addSubview:c1View];
        
        GLC2View *c2View = [GLC2View new];
        c2View.frame = CGRectMake(40 + 100, 30 + 20 + 20 + 150 - 60, 160, 100);
        [self addSubview:c2View];
    }
    return self;
}

@end
