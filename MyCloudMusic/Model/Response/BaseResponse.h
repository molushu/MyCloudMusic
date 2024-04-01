//
//  BaseResponse.h
//  通过网络请求响应模型
//
//  Created by zyh on 2024/4/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseResponse : NSObject

/// 状态码
/// 等于0表示成功
@property (nonatomic, assign) int status;

/// 出错的提示信息
/// 发生了错误不一定有
@property (nonatomic, strong) NSString *message;

@end

NS_ASSUME_NONNULL_END
