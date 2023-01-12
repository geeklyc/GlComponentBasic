//
//  UIImage+GLAdd.h
//  GlComponentBusinessIntraction
//
//  Created by liyoucheng on 2022/9/8.
//  Copyright © 2022 lyc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (GLAdd)

+ (UIImage *)gl_getBundleImageWithImageName:(NSString *)imageName withResourceName:(NSString *)resourceName;

@end

NS_ASSUME_NONNULL_END
