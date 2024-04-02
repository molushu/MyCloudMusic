//
//  GuideController.m
//  MyCloudMusic
//
//  Created by zyh on 2024/3/28.
//

//轮播图
#import <GKCycleScrollView/GKCycleScrollView.h>
#import <GKCycleScrollView/GKPageControl.h>

#import "GuideController.h"
#import "SuperHttpUtil.h"
#import "Video.h"

@interface GuideController ()<GKCycleScrollViewDataSource,GKCycleScrollViewDelegate>

@property (nonatomic, strong) GKCycleScrollView *contentScrollView;

@end

@implementation GuideController

- (void)initViews {
    [super initViews];
    
    [self initLinearLayoutSafeArea];
    
    // 轮播图容器
    MyRelativeLayout *bannerContainer = [MyRelativeLayout new];
    bannerContainer.myWidth = MyLayoutSize.fill;
    bannerContainer.myHeight = MyLayoutSize.wrap;
    bannerContainer.weight = 1;
    [self.container addSubview:bannerContainer];
    
    // 轮播图
    _contentScrollView=[GKCycleScrollView new];
    _contentScrollView.backgroundColor = [UIColor clearColor];
    _contentScrollView.dataSource = self;
    _contentScrollView.delegate = self;
    _contentScrollView.myWidth = MyLayoutSize.fill;
    _contentScrollView.myHeight = MyLayoutSize.fill;
    
    //禁用自动滚动
    _contentScrollView.isAutoScroll=NO;
    
    //不改变透明度
    _contentScrollView.isChangeAlpha=NO;
    
    _contentScrollView.clipsToBounds = YES;
    [bannerContainer addSubview:_contentScrollView];
    
    //指示器
    GKPageControl *pageControl = [[GKPageControl alloc] init];
    pageControl.userInteractionEnabled = NO;
    pageControl.style = GKPageControlStyleCycle;
    _contentScrollView.pageControl = pageControl;
    
    //默认颜色
    pageControl.pageIndicatorTintColor = [UIColor black80];
    
    //高亮颜色
    pageControl.currentPageIndicatorTintColor = [UIColor colorPrimary];
    pageControl.myWidth = MyLayoutSize.fill;
    pageControl.myHeight = 15;
    pageControl.myBottom=40;
    [bannerContainer addSubview:pageControl];
    
    // 按钮容器
    MyLinearLayout *controlContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Horz];
    controlContainer.myBottom = PADDING_LARGE2;
    controlContainer.myWidth = MyLayoutSize.fill;
    controlContainer.myHeight = MyLayoutSize.wrap;
    // 水平拉升，左，中，右间距一样
    controlContainer.gravity = MyGravity_Horz_Among;
    [self.container addSubview:controlContainer];
    
    //登录注册按钮
    QMUIButton *primaryButton = [ViewFactoryUtil primaryButton];
    [primaryButton setTitle:R.string.localizable.loginOrRegister forState:UIControlStateNormal];
    [primaryButton addTarget:self action:@selector(onPrimaryClick:) forControlEvents:UIControlEventTouchUpInside];
    primaryButton.myWidth=BUTTON_WIDTH_MEDDLE;
    [controlContainer addSubview:primaryButton];
    
    //立即体验按钮
    QMUIButton *enterButton = [ViewFactoryUtil primaryOutlineButton];
    [enterButton setTitle:R.string.localizable.experienceNow forState:UIControlStateNormal];
    [enterButton addTarget:self action:@selector(onEnterClick:) forControlEvents:UIControlEventTouchUpInside];
    enterButton.myWidth=BUTTON_WIDTH_MEDDLE;
    [controlContainer addSubview:enterButton];
}

- (void)initDatum{
    [super initDatum];
    self.datum = [NSMutableArray array];
    
    [self.datum addObject:R.image.guide1];
    [self.datum addObject:R.image.guide2];
    [self.datum addObject:R.image.guide3];
    [self.datum addObject:R.image.guide4];
    [self.datum addObject:R.image.guide5];
    [_contentScrollView reloadData];
}

- (void)onPrimaryClick:(QMUIButton *)sender{
//    [self testGet];
    
    //请求对象
//    [SuperHttpUtil requestObjectWith:[Video class] url:@"v1/videos/98" parameters:nil cachePolicy:MSCachePolicyOnlyNetNoCache method:MSRequestMethodGET loading:NO controller:nil success:^(BaseResponse * _Nonnull baseResponse, id  _Nonnull data) {
//        NSLog(@"request success %@",data);
//    } failure:^BOOL(BaseResponse * _Nullable baseResponse, NSError * _Nonnull error) {
//        NSLog(@"request error %@ %@",baseResponse,error);
//
//        return NO;
//    }];
    
//    [SuperHttpUtil requestObjectWith:[Video class] url:@"v1/videos" id:@"98" success:^(BaseResponse * _Nonnull baseResponse, id  _Nonnull data) {
//        NSLog(@"request success %@",data);
//    }];
    
    //视频详情
//    [[DefaultRepository shared] videoDetail:@"98" success:^(BaseResponse * _Nonnull baseResponse, id  _Nonnull data) {
//        NSLog(@"request success %@",data);
//    }];
    
    //视频列表
    [SuperHttpUtil requestListObjectWith:[Video class] url:@"v1/videos" success:^(BaseResponse * _Nonnull baseResponse, Meta * _Nonnull meta, NSArray * _Nonnull data) {
        NSLog(@"request success %@ %@",meta,data);
    }];
}

- (void)onEnterClick:(QMUIButton *)sender{
    
}

- (void)testGet{
    //参数
    NSDictionary *parameters = @{@"nickname":@"ixuea"};

    //地址
    NSString *url = @"v1/sheets";
    
    //发送请求
    [MSNetwork HTTPWithMethod:MSRequestMethodGET url:url parameters:parameters headers:nil cachePolicy:MSCachePolicyOnlyNetNoCache success:^(NSURLSessionDataTask *task,id  _Nonnull responseObject) {
        NSLog(@"get success %@",responseObject);
    } failure:^(NSURLSessionDataTask *task,NSError * _Nonnull error) {
        NSLog(@"get error %@",error);
    }];
}

#pragma mark  轮播图数据源

/// 有多少个
/// @param cycleScrollView <#cycleScrollView description#>
- (NSInteger)numberOfCellsInCycleScrollView:(GKCycleScrollView *)cycleScrollView{
    return self.datum.count;
}

/// 返回cell
/// @param cycleScrollView <#cycleScrollView description#>
/// @param index <#index description#>
- (GKCycleScrollViewCell *)cycleScrollView:(GKCycleScrollView *)cycleScrollView cellForViewAtIndex:(NSInteger)index {
    GKCycleScrollViewCell *cell = [cycleScrollView dequeueReusableCell];
    if (!cell) {
        cell = [GKCycleScrollViewCell new];
    }

    UIImage *data=[self.datum objectAtIndex:index];

    cell.imageView.image = data;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;

    return cell;
}

@end
