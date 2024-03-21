//
//  UIColor+Hex.h
//  用OC的类别（Category）语法，给UIColor类动态添加方法
//
//  Created by zyh on 2024/3/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)


/// 从16进制创建颜色
/// - Parameter hex: 8位16进制，argb，a：ff完全不透明，例如：0x33d6271c
+ (UIColor *)colorWithHex: (int)hex;

@end

NS_ASSUME_NONNULL_END
