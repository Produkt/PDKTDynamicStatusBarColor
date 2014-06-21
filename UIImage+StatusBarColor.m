//
//  UIImage+StatusBarColor.m
//  Caoba
//
//  Created by Daniel García García on 21/06/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import "UIImage+StatusBarColor.h"

@implementation UIImage (StatusBarColor)
+ (BOOL)isDarkImage:(UIImage*)inputImage{
    BOOL isDark = FALSE;
    CFDataRef imageData = CGDataProviderCopyData(CGImageGetDataProvider(inputImage.CGImage));
    const UInt8 *pixels = CFDataGetBytePtr(imageData);
    
    NSInteger darkPixels = 0;
    
    NSInteger length = CFDataGetLength(imageData);
    NSInteger const darkPixelThreshold = (inputImage.size.width*inputImage.size.height)*.45;
    
    for(NSInteger i=0; i<length; i+=4)
    {
        NSInteger r = pixels[i];
        NSInteger g = pixels[i+1];
        NSInteger b = pixels[i+2];
        
        //luminance calculation gives more weight to r and b for human eyes
        CGFloat luminance = (0.299*r + 0.587*g + 0.114*b);
        if (luminance<150) darkPixels ++;
    }
    
    if (darkPixels >= darkPixelThreshold)
        isDark = YES;
    
    CFRelease(imageData);
    
    return isDark;
    
}
@end
