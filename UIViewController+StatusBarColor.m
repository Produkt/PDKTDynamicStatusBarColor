//
//  UIViewController+StatusBarColor.m
//  Caoba
//
//  Created by Daniel García García on 21/06/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "UIViewController+StatusBarColor.h"
#import "UIImage+StatusBarColor.h"
#import <objc/runtime.h>

static NSString * const statusBarColorDarkColorContentKey = @"statusBarColorDarkColorContentKey";
@implementation UIViewController (StatusBarColor)
- (void)setDarkColorContent:(BOOL)darkColorContent{
    objc_setAssociatedObject(self, (__bridge const void *)(statusBarColorDarkColorContentKey), [NSNumber numberWithBool:darkColorContent], OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (BOOL)hasDarkColorContent{
    NSNumber *darkColorContent = objc_getAssociatedObject(self, (__bridge const void *)(statusBarColorDarkColorContentKey));
    return [darkColorContent boolValue];
}
- (void)adjustStatusBarColor{
    UIImage *image;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.frame.size.width, 20), YES, 1.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.darkColorContent = [UIImage isDarkImage:image];
    [self setNeedsStatusBarAppearanceUpdate];
}
@end
