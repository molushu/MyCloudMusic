//
//  AppDelegate.m
//  MyCloudMusic
//
//  Created by zyh on 2024/1/29.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (instancetype)shared {
    return UIApplication.sharedApplication.delegate;
}

- (void)toLoginHome {
    [self setRootViewController:@"LoginHomeNav"];
}

/// 设置根控制器
/// - Parameter data: <#data description#>
- (void)setRootViewController: (NSString *)data {
    // 获取到Main.storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // 实例化场景
    // 因为场景关联了控制器
    // 所以也可以说实例化了一个控制器
    // 只是这个过程是系统创建的
    // 不是我们手动完成
    UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:data];
    
    // 替换掉原来的根控制器
    // 目的是，我们不希望用户还能返回到原来的界面
    self.window.rootViewController = target;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

@end
