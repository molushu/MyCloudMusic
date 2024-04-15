//
//  AppDelegate.h
//  MyCloudMusic
//
//  Created by zyh on 2024/1/29.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

/// 获取单例对象
+(instancetype)shared;

/// 显示引导界面
-(void)toGuide;

/// 显示主界面
-(void)toMain;

@end

