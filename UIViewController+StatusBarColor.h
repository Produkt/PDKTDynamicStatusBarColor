//
//  UIViewController+StatusBarColor.h
//  Caoba
//
//  Created by Daniel García García on 21/06/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (StatusBarColor)
@property (nonatomic,assign,getter = hasDarkColorContent) BOOL darkColorContent;
- (void)adjustStatusBarColor;
@end
