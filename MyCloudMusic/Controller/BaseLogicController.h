//
//  BaseLogicController.h
//  项目中通用的逻辑控制器
//
//  Created by zyh on 2024/3/24.
//

//提供类似Android中更高层级的布局框架
#import <MyLayout/MyLayout.h>
#import "BaseCommonController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseLogicController : BaseCommonController

/// 根容器
@property (nonatomic, strong) MyBaseLayout *rootContainer;

/// 容器
@property (nonatomic, strong) MyBaseLayout *container;

/// frame容器，一般用来添加占位布局
@property (nonatomic, strong) MyBaseLayout *frameContainer;

/// 头部容器
@property (nonatomic, strong) MyBaseLayout *superHeaderContainer;
@property (nonatomic, strong) MyBaseLayout *superHeaderContentContainer;

/// 底部容器
@property (nonatomic, strong) MyBaseLayout *superFooterContainer;
@property (nonatomic, strong) MyBaseLayout *superFooterContentContainer;

/// 初始化垂直方向LinearLayout容器
- (void)initLinearLayout;

/// 初始化RelativeLayout容器，四边都在安全区内
- (void)initRelativeLayoutSafeArea;

/// 初始化垂直方向LinearLayout容器，四边都在安全区内
- (void)initLinearLayoutSafeArea;

@end

NS_ASSUME_NONNULL_END
