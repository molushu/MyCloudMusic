//
//  ResourceUtil.m
//  MyCloudMusic
//
//  Created by zyh on 2024/4/30.
//

#import "ResourceUtil.h"

@implementation ResourceUtil

+ (NSString *)resourceUri:(NSString *)data{
    return [NSString stringWithFormat:@"%@%@",RESOURCE_ENDPOINT,data];
}

@end
