//
//  AppDelegate.m
//  MyCloudMusic
//
//  Created by zyh on 2024/1/29.
//

#import "AppDelegate.h"
#import "SplashController.h"
#import "GuideController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+(instancetype)shared{
    return UIApplication.sharedApplication.delegate;
}

/// 显示引导界面
-(void)toGuide{
    GuideController *controller = [GuideController new];
    [self setRootViewController:controller];
}

-(void)setRootViewController:(UIViewController *)controller{
    self.window.rootViewController = controller;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 设置默认显示界面
    SplashController *controller = [SplashController new];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
