//
//  DiscoveryController.m
//  MyCloudMusic
//
//  Created by zyh on 2024/4/15.
//

#import "DiscoveryController.h"
#import "BannerData.h"

@interface DiscoveryController ()

@end

@implementation DiscoveryController

- (void)initViews {
    [super initViews];
    
    //初始化TableView结构
    [self initTableViewSafeArea];
}

- (void)initDatum{
    [super initDatum];
    
    [self loadData];
}

- (void)loadData:(BOOL)isPlaceholder{
    [self.datum removeAllObjects];
    
    //广告API
    [[DefaultRepository shared] bannerAdWithController:self success:^(BaseResponse * _Nonnull baseResponse, Meta * _Nonnull meta, NSArray * _Nonnull data) {
        //添加轮播图
        BannerData *bannerData=[BannerData new];
        bannerData.data = data;
        [self.datum addObject:bannerData];
    }];
}

@end
