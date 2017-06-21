//
//  UIImage+Helper.m
//  Baitu
//
//  Created by MaSong on 2016/12/3.
//  Copyright © 2016年 MaSong. All rights reserved.
//

#import "UIImage+Helper.h"

@implementation UIImage (Helper)
+ (UIImage *) imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
