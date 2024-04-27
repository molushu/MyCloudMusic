//
//  BannerCell.h
//  发现界面广告cell
//
//  Created by zyh on 2024/4/27.
//

#import "BaseTableViewCell.h"
#import "BannerData.h"

NS_ASSUME_NONNULL_BEGIN

static NSString * const BannerCellName = @"BannerCellName";

@interface BannerCell : BaseTableViewCell

-(void)bind:(BannerData *)data;

@end

NS_ASSUME_NONNULL_END
