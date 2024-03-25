//
//  BaseController.h
//  所有控制器父类
//
//  Created by zyh on 2024/3/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseController : UIViewController

/// 找控件
- (void)initViews;

/// 设置数据
- (void)initDatum;

/// 设置监听器
- (void)initListeners;

@end

NS_ASSUME_NONNULL_END
