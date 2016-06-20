//
//  ViewController.m
//  YXAnimations
//
//  Created by JI Yixuan on 16/6/20.
//  Copyright © 2016年 iamjiyixuan. All rights reserved.
//

#import "ViewController.h"

#import "YXFadeDemoViewController.h"
#import "YXMoveDemoViewController.h"
#import "YXSpringDemoViewController.h"

// 3rd
#import <Masonry/Masonry.h>

static NSString *const kItem_Identifer = @"io.iamjiyixuan.YXAnimations.Item.Identifer";
static NSString *const kItem_DemoClass = @"io.iamjiyixuan.YXAnimations.Item.DemoClass";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nullable, nonatomic, strong) UITableView *tableView;
@property(nullable, nonatomic, strong) NSMutableArray<NSDictionary *> *itemList;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem.title = @"";

    self.itemList = ({

        NSMutableArray<NSDictionary *> *array = @[].mutableCopy;

        {
            NSDictionary *item = @{ kItem_Identifer : @"Move",
                                    kItem_DemoClass : [YXMoveDemoViewController class] };
            [array addObject:item];
        }

        {
            NSDictionary *item = @{ kItem_Identifer : @"Fade",
                                    kItem_DemoClass : [YXFadeDemoViewController class] };
            [array addObject:item];
        }
        
        {
            NSDictionary *item = @{ kItem_Identifer : @"Spring",
                                    kItem_DemoClass : [YXSpringDemoViewController class] };
            [array addObject:item];
        }

        array;
    });

    self.tableView = ({

        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        view.dataSource = self;
        view.delegate = self;
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];

        [self.view addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(view.superview);
        }];

        view;
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *item = [self.itemList objectAtIndex:indexPath.row];
    NSString *itemIdentifier = [item objectForKey:kItem_Identifer];

    NSString *cellIdentifier = NSStringFromClass([UITableViewCell class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = itemIdentifier;

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *item = [self.itemList objectAtIndex:indexPath.row];
    Class itemDemoClass = [item objectForKey:kItem_DemoClass];

    UIViewController *vc = [[itemDemoClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
