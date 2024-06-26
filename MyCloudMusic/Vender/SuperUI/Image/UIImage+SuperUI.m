//
//  UIImage+SuperUI.m
//  MyCloudMusic
//
//  Created by zyh on 2024/4/15.
//

#import "UIImage+SuperUI.h"

@implementation UIImage (SuperUI)

+ (UIImage *)imageWithColor:(UIColor *)color {

   CGRect rect = CGRectMake(0.0f,0.0f, 1.0f,1.0f);

    UIGraphicsBeginImageContext(rect.size);

    CGContextRef context =UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);

    CGContextFillRect(context, rect);

    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

   return image;

}

@end
