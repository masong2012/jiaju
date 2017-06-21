//
//  BaseViewController.m
//  Note
//
//  Created by MaSong on 2017/4/25.
//  Copyright © 2017年 MaSong. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Helper.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)makeNavigationBarTranslucent{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:[UIColor clearColor]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
}

- (void)makeNavigationBarNormal{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:0.961 alpha:1.000]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:[UIColor colorWithWhite:0.875 alpha:1.000]];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
}



@end
