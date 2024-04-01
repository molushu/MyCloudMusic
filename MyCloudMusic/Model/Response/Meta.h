//
//  Meta.h
//  分页模型
//
//  Created by zyh on 2024/4/1.
//

#import "SuperBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface Meta : SuperBase

/// 有多少条
@property (nonatomic, assign) int total;

/// 有多少页
@property (nonatomic, assign) int pages;

/// 当前每页显示多少条
@property (nonatomic, assign) int size;

/// 当前页
@property (nonatomic, assign) int page;

/// 下一页
@property (nonatomic, assign) int next;

@end

NS_ASSUME_NONNULL_END
