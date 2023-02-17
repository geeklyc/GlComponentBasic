//
//  UIImage+B.m
//  GlComponentBasic
//
//  Created by liyoucheng on 2023/2/13.
//

#import "UIImage+B.h"

@implementation UIImage (B)

+ (UIImage *)getBBundleImageWithImageName:(NSString *)imageName {
//    NSString *mergeName = [NSString stringWithFormat:@"%@_%@", @"A", imageName];
//    UIImage *image = [UIImage getBundleImageWithImageName:mergeName withResourceName:@"Demo"];
//    if (!image) {
//        image = [UIImage getBundleImageWithImageName:imageName withResourceName:@"Demo"];
//    }
//    return image;
//    return [UIImage getBundleImageWithImageName:imageName withResourceName:@"B"];
    return nil;
}

//+ (UIImage *)getBundleImageWithImageName:(NSString *)imageName withResourceName:(NSString *)resourceName {
//    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:resourceName ofType:@"bundle"];
//    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
//    UIImage *image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
//    if (!image) {
//        bundlePath = [[NSBundle mainBundle] pathForResource:resourceName ofType:@"Resources"];
//        bundle = [NSBundle bundleWithPath:bundlePath];
//        image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
//    }
//    return image;
//}


@end
