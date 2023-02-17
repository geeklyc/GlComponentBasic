//
//  GLViewController.m
//  CocoaLumberjack
//
//  Created by liyoucheng on 2023/2/13.
//

#import "GLAViewController.h"

#import "Masonry.h"
#import "UIImage+A.h"
#import "GLBViewController.h"

@interface GLAViewController ()

@end

@implementation GLAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    UIImageView *imageView = [UIImageView new];
    [self.view addSubview:imageView];
    
    UIButton *button = [UIButton new];
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(goToB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
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
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(10.f);
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100.f, 44.f));
    }];
    
    titleLabel.text = @"A 页面";
    imageView.image = [UIImage getABundleImageWithImageName:@"1"];
}

- (void)goToB {
    GLBViewController *vc = [[GLBViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
