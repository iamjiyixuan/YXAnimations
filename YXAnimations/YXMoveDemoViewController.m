//
//  YXMoveDemoViewController.m
//  YXAnimations
//
//  Created by JI Yixuan on 16/6/20.
//  Copyright © 2016年 iamjiyixuan. All rights reserved.
//

#import "YXMoveDemoViewController.h"

// 3rd
#import <Masonry/Masonry.h>

@interface YXMoveDemoViewController ()

@end

@implementation YXMoveDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize cubeSize = CGSizeMake(100.0f, 50.0f);
    CGPoint oriPoint = CGPointMake(10.0f, 64.0f + 10.0f);
    CGFloat lineSpacing = 10.0f;
    UIColor *cubeColor = [UIColor colorWithRed:0.85f green:0.3f blue:0.3f alpha:1.0f];
    CGFloat move = [UIScreen mainScreen].bounds.size.width - cubeSize.width - 2 * 10.0f;
    {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(oriPoint.x, oriPoint.y, cubeSize.width, cubeSize.height)];
        view.backgroundColor = cubeColor;
        view.textColor = [UIColor whiteColor];
        view.text = @"CurveEaseInOut";
        view.font = [UIFont systemFontOfSize:10];
        view.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:view];
        
        CGRect oldFrame = view.frame;
        
        [UIView animateWithDuration:5.0f delay:0.0f options:UIViewAnimationOptionRepeat|UIViewAnimationOptionCurveEaseInOut animations:^{
            view.frame = CGRectMake(oldFrame.origin.x + move, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
        } completion:^(BOOL finished) {
        }];
    }
    
    {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, oriPoint.y + cubeSize.height + lineSpacing, cubeSize.width, cubeSize.height)];
        view.backgroundColor = cubeColor;
        view.textColor = [UIColor whiteColor];
        view.text = @"CurveEaseIn";
        view.font = [UIFont systemFontOfSize:10];
        view.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:view];
        
        CGRect oldFrame = view.frame;
        [UIView animateWithDuration:5.0f delay:0.0f options:UIViewAnimationOptionRepeat|UIViewAnimationOptionCurveEaseIn animations:^{
            view.frame = CGRectMake(oldFrame.origin.x + move, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
        } completion:^(BOOL finished) {
        }];
    }
    
    {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, oriPoint.y + 2 * (cubeSize.height + lineSpacing), cubeSize.width, cubeSize.height)];
        view.backgroundColor = cubeColor;
        view.textColor = [UIColor whiteColor];
        view.text = @"CurveEaseOut";
        view.font = [UIFont systemFontOfSize:10];
        view.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:view];
        
        CGRect oldFrame = view.frame;
        [UIView animateWithDuration:5.0f delay:0.0f options:UIViewAnimationOptionRepeat|UIViewAnimationOptionCurveEaseOut animations:^{
            view.frame = CGRectMake(oldFrame.origin.x + move, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
        } completion:^(BOOL finished) {
        }];
    }
    
    {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, oriPoint.y + 3 * (cubeSize.height + lineSpacing), cubeSize.width, cubeSize.height)];
        view.backgroundColor = cubeColor;
        view.textColor = [UIColor whiteColor];
        view.text = @"CurveLinear";
        view.font = [UIFont systemFontOfSize:10];
        view.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:view];
        
        CGRect oldFrame = view.frame;
        [UIView animateWithDuration:5.0f delay:0.0f options:UIViewAnimationOptionRepeat|UIViewAnimationOptionCurveLinear animations:^{
            view.frame = CGRectMake(oldFrame.origin.x + move, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
        } completion:^(BOOL finished) {
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
