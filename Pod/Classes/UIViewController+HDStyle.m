//
//  UIViewController+HDStyle.m
//  TestTemplate
//
//  Created by Dailingchi on 15/6/1.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "UIViewController+HDStyle.h"
#import <Aspects.h>

@implementation UIViewController (HDStyle)

+ (void)load
{
    NSError *error;
    [UIViewController
        aspect_hookSelector:@selector(viewDidLoad)
                withOptions:AspectPositionBefore
                 usingBlock:^(id<AspectInfo> aspectInfo) {
                   //注入逻辑
                   UIViewController *viewController = [aspectInfo instance];
                   if ([HDStyleConfig sharedInstance].autoConfig &&
                       [HDStyleConfig sharedInstance].viewControllerPrefix &&
                       [NSStringFromClass([viewController class])
                           hasPrefix:[HDStyleConfig sharedInstance].viewControllerPrefix])
                   {
                       [viewController configDefaultBackgroundWith:[HDStyleConfig sharedInstance]
                                                                       .backGroundColor];
                   }
                 } error:&error];
#ifdef DEBUG
    if (error)
    {
        NSLog(@"%@", error);
    }
#endif
}

- (void)configDefaultBackgroundWith:(UIColor *)backGroundColor
{
    if ([self isKindOfClass:[UIViewController class]])
    {
        self.view.backgroundColor = backGroundColor;
    }
    else if ([self isKindOfClass:[UITableViewController class]])
    {
        ((UITableViewController *)self).tableView.backgroundColor = backGroundColor;
    }
}

@end

@implementation HDStyleConfig

static HDStyleConfig *sharedHDStyleConfig = nil;

+ (HDStyleConfig *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedHDStyleConfig = [[HDStyleConfig alloc] init];
      sharedHDStyleConfig.autoConfig = NO;
      sharedHDStyleConfig.backGroundColor = [UIColor whiteColor];
    });
    return sharedHDStyleConfig;
}

@end
