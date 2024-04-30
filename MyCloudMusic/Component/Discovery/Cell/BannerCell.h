//
//  BannerCell.h
//  发现界面广告cell
//
//  Created by zyh on 2024/4/27.
//

//轮播图
#import <GKCycleScrollView/GKCycleScrollView.h>
#import <GKCycleScrollView/GKPageControl.h>

#import "BaseTableViewCell.h"
#import "BannerData.h"

NS_ASSUME_NONNULL_BEGIN

static NSString * const BannerCellName = @"BannerCellName";

@interface BannerCell : BaseTableViewCell

@property (nonatomic, strong) GKCycleScrollView *contentScrollView;
@property (nonatomic, strong) NSMutableArray *datum;

-(void)bind:(BannerData *)data;

@end

NS_ASSUME_NONNULL_END
