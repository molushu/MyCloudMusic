//
//  ViewFactoryUtil.m
//  MyCloudMusic
//
//  Created by zyh on 2024/3/25.
//

#import "ViewFactoryUtil.h"
#import "Constant.h"

@implementation ViewFactoryUtil

+(QMUIButton *)primaryButton{
    QMUIButton *result = [[QMUIButton alloc] init];
    result.adjustsTitleTintColorAutomatically = NO;
    result.adjustsButtonWhenHighlighted = YES;
    result.titleLabel.font = UIFontMake(TEXT_LARGE);
    result.myWidth = MyLayoutSize.fill;
    result.myHeight = BUTTON_MEDDLE;
    result.backgroundColor = [UIColor colorPrimary];
    result.layer.cornerRadius = SMALL_RADIUS;
    result.tintColor = [UIColor colorLightWhite];
    [result setTitleColor:[UIColor colorLightWhite] forState:UIControlStateNormal];
    return result;
}

+(QMUIButton *)primaryHalfFilletButton{
    QMUIButton *result = [self primaryButton];
    result.layer.cornerRadius = BUTTON_MEDDLE_RADIUS;
    return result;
}

+(QMUIButton *)linkButton{
    QMUIButton *result = [[QMUIButton alloc] init];
    result.adjustsTitleTintColorAutomatically = NO;
    result.titleLabel.font = UIFontMake(TEXT_MEDDLE);
    
    return result;
}

+ (QMUIButton *)primaryOutlineButton{
    QMUIButton *result = [self primaryButton];
    result.layer.cornerRadius = SMALL_RADIUS;
    
    result.tintColor = [UIColor black130];
    result.layer.borderWidth = 1;
    result.layer.borderColor = [[UIColor black130] CGColor];
    result.backgroundColor = [UIColor clearColor];
    [result setTitleColor:[UIColor colorPrimary] forState:UIControlStateNormal];
    
    return result;
}

@end
