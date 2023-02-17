//
//  GLViewController.m
//  GlComponentBasic
//
//  Created by lyc on 09/07/2022.
//  Copyright (c) 2022 lyc. All rights reserved.
//

#import "GLViewController.h"

#import "Masonry.h"

#import "GLAViewController.h"

//#import "GlCrashAnalyticsDependencyFactory.h"
//#import "GLLeakViewController.h"
//#import "GLUISourceViewController.h"

@interface GLViewController ()

@property (nonatomic, strong) UIScrollView *logScrollView;
@property (nonatomic, strong) UILabel *logLabel;

@end

@implementation GLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    [self setupUI];
    [self setupConstraints];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        GLAViewController *vc = [GLAViewController new];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:nav animated:YES completion:nil];
    });
    
//    [GlCrashAnalyticsDependencyFactory createExceptionHandler];
//
//    NSArray *titles = @[ @"数组越界", @"Leak 泄露", @"UI响应链" ];
//    for (NSInteger i = 0; i < [titles count]; i++) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(10 + (100 + 10) * (i % 3), 30 + (30 + 3) * (i / 5), 100, 30);
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setTitle:titles[i] forState:UIControlStateNormal];
//        button.backgroundColor = [UIColor lightGrayColor];
//        [button addTarget:self action:@selector(handleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:button];
//    }
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        GLUISourceViewController *vc = [GLUISourceViewController new];
//        vc.modalPresentationStyle = UIModalPresentationFullScreen;
//        [self presentViewController:vc animated:YES completion:nil];
//    });
    
//    self.logScrollView.backgroundColor = [UIColor greenColor];
    
//    self.logLabel.text = @"大量文本";
//    [self bug1];
}

// MARK: - event responders

- (void)handleBtnClick:(UIButton *)btn {
//    NSString *title = [btn titleForState:UIControlStateNormal];
//    if ([title isEqualToString:@"数组越界"]) {
//        // 数组越界
//        [self bug1];
//        return;
//    }
//
//    if ([title isEqualToString:@"Leak 泄露"]) {
//        // 数组越界
//        GLLeakViewController *vc = [GLLeakViewController new];
//        vc.modalPresentationStyle = UIModalPresentationFullScreen;
//        [self presentViewController:vc animated:YES completion:nil];
//        return;
//    }
//
//    if ([title isEqualToString:@"UI响应链"]) {
//        GLUISourceViewController *vc = [GLUISourceViewController new];
//        vc.modalPresentationStyle = UIModalPresentationFullScreen;
//        [self presentViewController:vc animated:YES completion:nil];
//        return;
//    }
    
    
}

// MARK: - private methods

// MARK: - - UI

- (void)setupUI {
    [self.view addSubview:self.logScrollView];
    [self.logScrollView addSubview:self.logLabel];
}

- (void)setupConstraints {
    [self.logScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
        make.center.equalTo(self.view);
    }];
    
    [self.logLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.logScrollView);
        make.centerX.equalTo(self.logScrollView);
        make.top.equalTo(self.logScrollView).offset(30.f);
        make.height.mas_greaterThanOrEqualTo(100.f);
    }];
}

// MARK: - - bug

- (void)bug1 {
    NSArray *list = @[];
    NSString *name = list[0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIScrollView *)logScrollView {
    if (!_logScrollView) {
        _logScrollView = [UIScrollView new];
        _logScrollView.contentSize = self.view.bounds.size;
    }
    return _logScrollView;
}

- (UILabel *)logLabel {
    if (!_logLabel) {
        _logLabel = [UILabel new];
        _logLabel.font = [UIFont systemFontOfSize:13.f];
        _logLabel.numberOfLines = 0;
    }
    return _logLabel;
}

@end
