//
//  BaseController.m
//  MyCloudMusic
//
//  Created by zyh on 2024/3/24.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"BaseController viewDidLoad");
    [self initViews];
    [self initDatum];
    [self initListeners];
}

- (void)initViews{
    NSLog(@"BaseController initViews");
}

- (void)initDatum{
    NSLog(@"BaseController initDatum");
}

- (void)initListeners{
    NSLog(@"BaseController initListeners");
}

@end
