//
//  UIViewController+HDLayout.h
//  TestTemplate
//
//  Created by Dailingchi on 15/6/1.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIViewController,布局相关配置
 */
@interface UIViewController (HDLayout)

/**
 *  布局方式
 */
- (void)configEdgesForExtendedLayout;

@end

/**
 *  布局相关配置
 */
@interface HDLayoutConfig : NSObject

/**
 *  自动配置UIViewController默认信息,默认为NO.
 */
@property (nonatomic, assign) BOOL autoConfig;

/**
 *  ViewController前缀(为了区分自定义的VC和第三方VC),默认为空.
 */
@property (nonatomic, strong) NSString *viewControllerPrefix;

+ (HDLayoutConfig *)sharedInstance;

@end
