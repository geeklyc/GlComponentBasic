//
//  GLBViewController.m
//  CocoaLumberjack
//
//  Created by liyoucheng on 2023/2/13.
//

#import "GLBViewController.h"

#import "Masonry.h"
#import "UIImage+B.h"

@interface GLBViewController ()

@end

@implementation GLBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    UIImageView *imageView = [UIImageView new];
    [self.view addSubview:imageView];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15.f);
        make.centerY.equalTo(self.view).offset(50.f);
        make.right.equalTo(self.view).offset(-15.f);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(10.f);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100.f, 100.f));
    }];
    
    titleLabel.text = @"B 页面";
    imageView.image = [UIImage getBBundleImageWithImageName:@"1"];
}

@end
