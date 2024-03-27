//
//  DefaultPreferenceUtil.h
//  MyCloudMusic
//
//  Created by zyh on 2024/3/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DefaultPreferenceUtil : NSObject

/// 是否同意了用户条款
+(BOOL)isAcceptTermsServiceAgreement;

/// 设置同意了用户协议
/// @param data <#data description#>
+(void)setAcceptTermsServiceAgreement:(BOOL)data;

@end

NS_ASSUME_NONNULL_END
