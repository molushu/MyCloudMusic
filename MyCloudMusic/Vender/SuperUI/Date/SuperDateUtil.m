//
//  SuperDateUtil.m
//  MyCloudMusic
//
//  Created by zyh on 2024/3/18.
//

#import "SuperDateUtil.h"

@implementation SuperDateUtil

+ (NSInteger)currentYear {
    // 当前日期
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    NSDateComponents *d = [cal components:unitFlags fromDate:date];
    // 然后就可以从d中获取具体的年月日了
    NSInteger year = [d year];
//    NSInteger month = [d month];
//    NSInteger day = [d day];
    
    return year;
}

@end
