//
//  GLC2View.m
//  GlComponentBasic_Example
//
//  Created by liyoucheng on 2023/2/1.
//  Copyright © 2023 lyc. All rights reserved.
//

#import "GLC2View.h"

@implementation GLC2View

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(10, 10, 100, 20);
        label.text = @"C2";
        [self addSubview:label];
    }
    return self;
}

@end
