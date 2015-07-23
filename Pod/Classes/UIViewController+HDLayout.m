//
//  UIViewController+HDLayout.m
//  TestTemplate
//
//  Created by Dailingchi on 15/6/1.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "UIViewController+HDLayout.h"
#import <Aspects.h>

@implementation UIViewController (HDLayout)

+ (void)load
{
    NSError *error;
    [UIViewController
        aspect_hookSelector:@selector(viewDidLoad)
                withOptions:AspectPositionBefore
                 usingBlock:^(id<AspectInfo> aspectInfo) {
                   //注入逻辑
                   UIViewController *viewController = [aspectInfo instance];
                   if ([HDLayoutConfig sharedInstance].autoConfig &&
                       [HDLayoutConfig sharedInstance].viewControllerPrefix &&
                       [NSStringFromClass([viewController class])
                           hasPrefix:[HDLayoutConfig sharedInstance].viewControllerPrefix])
                   {
                       [viewController configEdgesForExtendedLayout];
                   }
                 } error:&error];
#ifdef DEBUG
    if (error)
    {
        NSLog(@"%@", error);
    }
#endif
}

- (void)configEdgesForExtendedLayout
{
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        [self performSelector:@selector(setEdgesForExtendedLayout:) withObject:UIRectEdgeNone];
    }
}

@end

@implementation HDLayoutConfig

static HDLayoutConfig *sharedHDLayoutConfig = nil;

+ (HDLayoutConfig *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedHDLayoutConfig = [[HDLayoutConfig alloc] init];
      sharedHDLayoutConfig.autoConfig = NO;
    });
    return sharedHDLayoutConfig;
}

@end
