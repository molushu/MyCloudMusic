//
//  SplashController.m
//  MyCloudMusic
//
//  Created by zyh on 2024/3/18.
//

// 提供类似Android中更高层级的布局框架
#import <MyLayout/MyLayout.h>
#import "SplashController.h"
#import "SuperDateUtil.h"
#import "R.h"
#import "UIColor+Config.h"
#import "UIColor+Theme.h"

@interface SplashController ()

@end

@implementation SplashController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 默认颜色，如果某些界面不一样，再单独设置
    self.view.backgroundColor = [UIColor colorBackground];
    
    // 根容器
    MyRelativeLayout *container = [MyRelativeLayout new];
    
    // 从安全区开始
    container.leadingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    container.trailingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    container.topPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    container.bottomPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    
    [self.view addSubview:container];
    
    // banner
    UIImageView *bannerView = [UIImageView new];
    bannerView.myWidth = 75;
    bannerView.myHeight = 309;
    bannerView.myTop= 120;
    bannerView.myCenterX = 0;
    bannerView.image = [UIImage imageNamed:@"SplashBanner"];
    [container addSubview:bannerView];
    
    // 版权
    NSInteger year = [SuperDateUtil currentYear];
    
    UILabel *agrementView = [UILabel new];
    agrementView.myWidth = MyLayoutSize.wrap;
    agrementView.myHeight = 15;
    agrementView.myBottom = 20;
    agrementView.myCenterX = 0;
    agrementView.font = [UIFont systemFontOfSize:12];
    agrementView.textColor = [UIColor black80];
    
//    NSString *result = NSLocalizedString(@"Copyright", @"");
//    result = [NSString stringWithFormat:result, year];
//    agrementView.text = result;
    
    // 使用R.objc框架
    agrementView.text = [R.string.localizable copyright:year];
    [container addSubview:agrementView];
    
    // logo
    UIImageView *logoView = [UIImageView new];
    logoView.myWidth = 188;
    logoView.myHeight = 31;
    logoView.bottomPos.equalTo(agrementView.topPos).offset(16);
    logoView.myCenterX = 0;
    logoView.image = [UIImage imageNamed:@"SplashLogo"];
    logoView.contentMode = UIViewContentModeScaleAspectFit;
    [container addSubview:logoView];
}

@end
