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
    [self initNetwork];
    
    // 设置默认显示界面
    SplashController *controller = [SplashController new];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
    return YES;
}

/// 初始化网络框架
- (void)initNetwork{
#ifdef DEBUG
    //开启日志打印 默认打开(Debug级别)
    [MSNetwork openLog];
#endif
    
    //最终完整Url为[NSString stringWithFormat:@“%@%@”,_baseURL,URL]，
    [MSNetwork setBaseURL:ENDPOINT];
    
    //设置全局请求参数
    //NSDictionary *dic = @{@"accountToken":@{@"clientType":@"",@"tokenKey":@""}};
    //[MSNetwork setBaseParameters:dic];
    
    //设置网络请求超时时间
    [MSNetwork setRequestTimeoutInterval:10.0f];
    
    //设置网络请求头
    //可一次设置多个也可单独设置
    //[MSNetwork setHeadr:@{@"api-version":@"v1.0.0"}];
    //[MSNetwork setValue:@"9" forHTTPHeaderField:@"fromType"];
    
    //请求数据为json
    [MSNetwork setRequestSerializer:MSRequestSerializerJSON];
}

@end
