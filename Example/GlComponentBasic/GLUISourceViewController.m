//
//  GLUISourceViewController.m
//  GlComponentBasic_Example
//
//  Created by liyoucheng on 2023/2/1.
//  Copyright © 2023 lyc. All rights reserved.
//

#import "GLUISourceViewController.h"

#import "GLAView.h"

@interface GLUISourceViewController ()

@end

@implementation GLUISourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GLAView *aView = [GLAView new];
    aView.frame = self.view.bounds;
    [self.view addSubview:aView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
