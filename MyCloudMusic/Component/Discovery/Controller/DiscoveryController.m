//
//  DiscoveryController.m
//  MyCloudMusic
//
//  Created by zyh on 2024/4/15.
//

#import "DiscoveryController.h"
#import "BannerData.h"
#import "BannerCell.h"

@interface DiscoveryController ()

@end

@implementation DiscoveryController

- (void)initViews {
    [super initViews];
    
    //初始化TableView结构
    [self initTableViewSafeArea];
    
    //注册轮播图cell
    //也可以放到header中，这里之所以放到cell
    //是要实现列表的数据可以调整显示顺序
    [self.tableView registerClass:[BannerCell class] forCellReuseIdentifier:BannerCellName];
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
        
        [self.tableView reloadData];
    }];
}

#pragma mark - 列表数据源

/// 返回当前位置的cell
/// 相当于Android中RecyclerView Adapter的onCreateViewHolder
/// @param tableView <#tableView description#>
/// @param indexPath <#indexPath description#>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *data= self.datum[indexPath.row];
    
    //轮播图
    BannerCell *cell = [tableView dequeueReusableCellWithIdentifier:BannerCellName forIndexPath:indexPath];
    
    //绑定数据
    [cell bind:data];
    
    return cell;
}

@end
