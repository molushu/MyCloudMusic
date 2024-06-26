//
//  UIImage+SuperUI.h
//  对图片扩展一些常用方法
//
//  Created by zyh on 2024/4/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SuperUI)

/// 根据颜色创建图片
/// @param color color description
+ (UIImage *)imageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
