//
//  GLB1View.m
//  GlComponentBasic_Example
//
//  Created by liyoucheng on 2023/2/1.
//  Copyright © 2023 lyc. All rights reserved.
//

#import "GLB1View.h"

@implementation GLB1View

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(10, 10, 100, 20);
        label.text = @"B1";
        [self addSubview:label];
    }
    return self;
}

@end
