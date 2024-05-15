//
//  IconTitleButtonData.h
//  图标文本按钮模型
//
//  Created by zyh on 2024/5/12.
//

#import "SuperBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface IconTitleButtonData : SuperBase

@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *title;

/// 通过标题，图标创建
/// @param title <#title description#>
/// @param icon <#icon description#>
+(instancetype)withTitle:(NSString *)title icon:(UIImage *)icon;

@end

NS_ASSUME_NONNULL_END
