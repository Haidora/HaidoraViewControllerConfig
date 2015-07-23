//
//  UIViewController+HDStyle.h
//  TestTemplate
//
//  Created by Dailingchi on 15/6/1.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIViewController UI相关的配置
 */
@interface UIViewController (HDStyle)

/**
 *  设置View(TableView背景),默认加载HDStyleConfig中的backGroundColor.
 */
- (void)configDefaultBackgroundWith:(UIColor *)backGroundColor;

@end

/**
 *  UI相关的配置
 */
@interface HDStyleConfig : NSObject

/**
 *  自动配置UIViewController默认信息,默认为NO.
 */
@property (nonatomic, assign) BOOL autoConfig;

/**
 *  ViewController前缀(为了区分自定义的VC和第三方VC),默认为空.
 */
@property (nonatomic, strong) NSString *viewControllerPrefix;
/**
 *  背景颜色,默认为[UIColor whiteColor].
 */
@property (nonatomic, strong) UIColor *backGroundColor;

+ (HDStyleConfig *)sharedInstance;

@end
