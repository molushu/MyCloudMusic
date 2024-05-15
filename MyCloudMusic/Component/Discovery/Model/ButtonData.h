//
//  ButtonData.h
//  发现界面，快捷按钮数据
//
//  Created by zyh on 2024/5/12.
//

#import "SuperBase.h"
#import "IconTitleButtonData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ButtonData : SuperBase

/// 按钮列表
/// 类型为：IconTitleButtonData
@property (nonatomic, strong) NSMutableArray *datum;

@end

NS_ASSUME_NONNULL_END
