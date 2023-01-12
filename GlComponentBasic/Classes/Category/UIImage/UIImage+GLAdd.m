//
//  UIImage+GLAdd.m
//  GlComponentBusinessIntraction
//
//  Created by liyoucheng on 2022/9/8.
//  Copyright © 2022 lyc. All rights reserved.
//

#import "UIImage+GLAdd.h"

@implementation UIImage (GLAdd)

+ (UIImage *)gl_getBundleImageWithImageName:(NSString *)imageName withResourceName:(NSString *)resourceName {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:resourceName ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    if (!image) {
        bundlePath = [[NSBundle mainBundle] pathForResource:resourceName ofType:@"Resources"];
        bundle = [NSBundle bundleWithPath:bundlePath];
        image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    }
    return image;
}

@end
