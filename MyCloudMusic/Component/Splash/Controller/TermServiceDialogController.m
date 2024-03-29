//
//  TermServiceDialogController.m
//  MyCloudMusic
//
//  Created by zyh on 2024/3/25.
//

#import "TermServiceDialogController.h"
#import "UIColor+Config.h"
#import "UIColor+Theme.h"
#import "ViewFactoryUtil.h"
#import "R.h"
#import "Constant.h"

@interface TermServiceDialogController ()<QMUIModalPresentationContentViewControllerProtocol>

@end

@implementation TermServiceDialogController

- (void)initViews {
    [super initViews];
    
    self.view.backgroundColor = [UIColor colorDivider];
    self.view.myWidth = MyLayoutSize.fill;
    self.view.myHeight = MyLayoutSize.wrap;
    
    // 根容器
    self.rootContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    self.rootContainer.subviewSpace = 0.5;
    self.rootContainer.myWidth = MyLayoutSize.fill;
    self.view.myHeight = MyLayoutSize.wrap;
    [self.view addSubview:self.rootContainer];
    
    //内容容器
    self.contentContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    self.contentContainer.subviewSpace=25;
    self.contentContainer.myWidth=MyLayoutSize.fill;
    self.contentContainer.myHeight=MyLayoutSize.wrap;
    self.contentContainer.backgroundColor = [UIColor colorBackground];
    self.contentContainer.padding=UIEdgeInsetsMake(PADDING_LARGE2, PADDING_OUTER, PADDING_LARGE2, PADDING_OUTER);
    self.contentContainer.gravity=MyGravity_Horz_Center;
    [self.rootContainer addSubview:self.contentContainer];
    
    //标题
    [self.contentContainer addSubview:self.titleView];
    self.textView=[UITextView new];
    self.textView.myWidth=MyLayoutSize.fill;
    //超出的内容，自动支持滚动
    self.textView.myHeight=230;
    self.textView.text=@"公司CFO David Wehner也在财报中给出了眼下正在面临的一系列增长压力。Wehner透露，目前各个内容平台对消费者使用时间的竞争正在加剧。即便是在公司内部的产品线中，消费者的粘性也呈现向Reels这样的视频界面转移的倾向，但该功能的货币转化率要低于信息流等传统文字业务。此外，META也预期苹果的iOS系统规则变更和监管带来的变化将继续对定向广告业务带来负面影响，同时实体经济中的通胀和供应链问题也会影响广告主的预算。此外在美联储加息周期中，外汇（美元对其他货币升值）也将成为公司营收增长的负面因素。作为Facebook的母公司，Meta Platforms Inc.第四季度用户增长陷入停滞，并且本季度展望令人失望，引发了对于该公司未来增长前景的担忧，该公司最终可能难以证明对元宇宙（首席执行官扎克伯格的沉浸式互联网愿景）的昂贵押注是合理的公司CFO David Wehner也在财报中给出了眼下正在面临的一系列增长压力。Wehner透露，目前各个内容平台对消费者使用时间的竞争正在加剧。即便是在公司内部的产品线中，消费者的粘性也呈现向Reels这样的视频界面转移的倾向，但该功能的货币转化率要低于信息流等传统文字业务。此外，META也预期苹果的iOS系统规则变更和监管带来的变化将继续对定向广告业务带来负面影响，同时实体经济中的通胀和供应链问题也会影响广告主的预算。此外在美联储加息周期中，外汇（美元对其他货币升值）也将成为公司营收增长的负面因素。作为Facebook的母公司，Meta Platforms Inc.第四季度用户增长陷入停滞，并且本季度展望令人失望，引发了对于该公司未来增长前景的担忧，该公司最终可能难以证明对元宇宙（首席执行官扎克伯格的沉浸式互联网愿景）的昂贵押注是合理的";
    self.textView.backgroundColor = [UIColor clearColor];
    //禁用编辑
    self.textView.editable=NO;
    [self.contentContainer addSubview:self.textView];
    
    [self.contentContainer addSubview:self.primaryButton];
    
    // 不同意按钮
    self.disagreeButton = [ViewFactoryUtil linkButton];
    [self.disagreeButton setTitle:R.string.localizable.disagree forState: UIControlStateNormal];
    [self.disagreeButton setTitleColor:[UIColor black80] forState:UIControlStateNormal];
    [self.disagreeButton addTarget:self action:@selector(disagreeClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.disagreeButton sizeToFit];
    [self.contentContainer addSubview:self.disagreeButton];
}

- (void)show{
    self.modalController = [QMUIModalPresentationViewController new];
    self.modalController.animationStyle = QMUIModalPresentationAnimationStyleFade;
    
    //点击外部不隐藏
    [self.modalController setModal:YES];
    
    //边距
    self.modalController.contentViewMargins=UIEdgeInsetsMake(PADDING_LARGE2, PADDING_LARGE2, PADDING_LARGE2, PADDING_LARGE2);
    
    //设置要显示的内容控件
    self.modalController.contentViewController=self;
    
    [self.modalController showWithAnimated:YES completion:nil];
}

- (void)hide{
    [self.modalController hideWithAnimated:YES completion:nil];
}

#pragma mark - 事件
-(void)disagreeClick:(UIButton *)sender{
    [self hide];
    
    //退出应用
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    UIWindow *window = app.window;
//
//    [UIView animateWithDuration:0.5f animations:^{
//        window.alpha = 0;
//        window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
//    } completion:^(BOOL finished) {
//        exit(0);
//    }];
    
    exit(0);
}

#pragma mark - 创建控件
- (UILabel *)titleView{
    if (!_titleView) {
        _titleView=[UILabel new];
        _titleView.myWidth=MyLayoutSize.fill;
        _titleView.myHeight=MyLayoutSize.wrap;
        _titleView.text=@"标题";
        _titleView.textAlignment=NSTextAlignmentCenter;
        _titleView.font=[UIFont boldSystemFontOfSize:TEXT_LARGE3];
        _titleView.textColor=[UIColor colorOnSurface];
    }
    return _titleView;
}

- (QMUIButton *)primaryButton{
    if (!_primaryButton) {
        _primaryButton = [ViewFactoryUtil primaryHalfFilletButton];
        [_primaryButton setTitle:R.string.localizable.agree forState:UIControlStateNormal];
    }
    return _primaryButton;
}

@end
