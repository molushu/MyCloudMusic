//
//  IconTitleButtonData.m
//  MyCloudMusic
//
//  Created by zyh on 2024/5/12.
//

#import "IconTitleButtonData.h"

@implementation IconTitleButtonData

+ (instancetype)withTitle:(NSString *)title icon:(UIImage *)icon{
    IconTitleButtonData *result = [IconTitleButtonData new];
    
    result.title=title;
    result.icon=icon;
    
    return result;
}

@end
