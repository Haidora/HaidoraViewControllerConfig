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
                   if ([HDStyleConfig sharedInstance].autoConfig)
                   {
                       [[HDStyleConfig sharedInstance]
                               .viewControllerPrefixs
                           enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
                             if ([obj isKindOfClass:[NSString class]])
                             {
                                 if ([NSStringFromClass([viewController class]) hasPrefix:obj])
                                 {
                                     [viewController
                                         configDefaultBackgroundWith:[HDStyleConfig sharedInstance]
                                                                         .backGroundColor];
                                     *stop = YES;
                                 }
                             }
                             else
                             {
                                 NSAssert(NO,
                                          @"%@ in viewControllerPrefixs must subClass of NSString",
                                          obj);
                             }
                           }];
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

@interface HDStyleConfig ()

@property (nonatomic, strong, readwrite) NSMutableArray *viewControllerPrefixs;

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

- (NSMutableArray *)viewControllerPrefixs
{
    if (nil == _viewControllerPrefixs)
    {
        _viewControllerPrefixs = [[NSMutableArray alloc] init];
    }
    return _viewControllerPrefixs;
}

@end
