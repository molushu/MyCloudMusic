//
//  BaseLogicController.m
//  MyCloudMusic
//
//  Created by zyh on 2024/3/24.
//

#import "BaseLogicController.h"

@interface BaseLogicController ()

@end

@implementation BaseLogicController

- (void)initViews {
    [super initViews];
    // 默认颜色，如果某些界面不一样，再单独设置
    [self setBackgroundColor:[UIColor colorBackground]];
}

/// 初始化垂直方向LinearLayout容器
- (void)initLinearLayout{
    _rootContainer = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    _rootContainer.myWidth = MyLayoutSize.fill;
    _rootContainer.myHeight = MyLayoutSize.fill;
    _rootContainer.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_rootContainer];
}

/// 初始化RelativeLayout容器，四边都在安全区内
- (void)initRelativeLayoutSafeArea{
    [self initLinearLayout];
    
    //header
    [self initHeaderContainer];
    
    _container = [MyRelativeLayout new];
    _container.myWidth = MyLayoutSize.fill;
    _container.myHeight = MyLayoutSize.wrap;
    // 填充父容器剩余的全部高度
    _container.weight=1;
    _container.backgroundColor = [UIColor clearColor];
    [_rootContainer addSubview:_container];
    
    [self initFooterContainer];
}

/// 初始化垂直方向LinearLayout容器，四边都在安全区内
- (void)initLinearLayoutSafeArea{
    [self initLinearLayout];
    
    //header
    [self initHeaderContainer];
    
    //frame
    self.frameContainer=[MyRelativeLayout new];
    self.frameContainer.myWidth = MyLayoutSize.fill;
    self.frameContainer.myHeight = MyLayoutSize.wrap;
    self.frameContainer.weight=1;
    self.frameContainer.backgroundColor = [UIColor clearColor];
    [_rootContainer addSubview:self.frameContainer];
    
    _container = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    _container.myWidth = MyLayoutSize.fill;
    _container.myHeight = MyLayoutSize.fill;
    _container.gravity = MyGravity_Vert_Stretch;
    _container.backgroundColor = [UIColor clearColor];
    [self.frameContainer addSubview:_container];
    
    //footer，一般是底部要显示按钮，例如：购物车界面，商城相关界面
    //当然也可以细分到需要的界面才添加，但这样会增加复杂度
    [self initFooterContainer];
}

/// 头部容器，安全区外，一般用来设置头部到安全区外背景颜色
-(void)initHeaderContainer{
    self.superHeaderContainer=[[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    self.superHeaderContainer.myWidth = MyLayoutSize.fill;
    self.superHeaderContainer.myHeight = MyLayoutSize.wrap;
    self.superHeaderContainer.backgroundColor = [UIColor clearColor];
    
    //头部内容容器，安全区内
    self.superHeaderContentContainer=[[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    self.superHeaderContentContainer.backgroundColor = [UIColor clearColor];
    self.superHeaderContentContainer.leadingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    self.superHeaderContentContainer.trailingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    self.superHeaderContentContainer.topPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    self.superHeaderContentContainer.myHeight = MyLayoutSize.wrap;
    
    [self.superHeaderContainer addSubview:self.superHeaderContentContainer];
    [self.rootContainer addSubview:self.superHeaderContainer];
}

-(void)initFooterContainer{
    self.superFooterContainer=[[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    self.superFooterContainer.myWidth = MyLayoutSize.fill;
    self.superFooterContainer.myHeight = MyLayoutSize.wrap;
    self.superFooterContainer.backgroundColor = [UIColor clearColor];
    
    //底部内容容器，安全区内
    self.superFooterContentContainer=[[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    self.superFooterContentContainer.backgroundColor = [UIColor clearColor];
    self.superFooterContentContainer.leadingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    self.superFooterContentContainer.trailingPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    self.superFooterContentContainer.bottomPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    self.superFooterContentContainer.myHeight=MyLayoutSize.wrap;
    
    [self.superFooterContainer addSubview:self.superFooterContentContainer];
    [self.rootContainer addSubview:self.superFooterContainer];
}

@end
