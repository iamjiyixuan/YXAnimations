//
//  YXSpringDemoViewController.m
//  YXAnimations
//
//  Created by JI Yixuan on 16/6/20.
//  Copyright © 2016年 iamjiyixuan. All rights reserved.
//

#import "YXSpringDemoViewController.h"

@interface YXSpringDemoViewController ()

@end

@implementation YXSpringDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize cubeSize = CGSizeMake(50.0f, 50.0f);
    UIColor *cubeColor = [UIColor colorWithRed:0.85f green:0.3f blue:0.3f alpha:1.0f];
    
    {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cubeSize.width, cubeSize.height)];
        view.center = self.view.center;
        view.backgroundColor = cubeColor;
        view.textColor = [UIColor whiteColor];
        view.font = [UIFont systemFontOfSize:10];
        view.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:view];
        
        [UIView animateWithDuration:3.0f delay:1 usingSpringWithDamping:0.1f initialSpringVelocity:0 options:UIViewAnimationOptionRepeat animations:^{
            view.center = CGPointMake(view.center.x, view.center.y + 130.0f);
        } completion:^(BOOL finished) {
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
