//
//  UIColor_MBWPExtensions.m
//  Weekend Picks
//
//  Created by Justin Miller on 6/18/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "UIColor+MBWPExtensions.h"

@interface UIColor (MBWPExtensions_Private)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;
- (CGColorSpaceModel)colorSpaceModel;
- (BOOL)canProvideRGBComponents;
- (BOOL)red:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha;
- (UInt32)rgbHex;

@end

#pragma mark -

@implementation UIColor (MBWPExtensions)

+ (UIColor *)colorWithRGBHex:(UInt32)hex
{
	int r = (hex >> 16) & 0xFF;
	int g = (hex >> 8) & 0xFF;
	int b = (hex) & 0xFF;
    
	return [UIColor colorWithRed:r / 255.0f
						   green:g / 255.0f
							blue:b / 255.0f
						   alpha:1.0f];
}

- (CGColorSpaceModel)colorSpaceModel
{
	return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

- (BOOL)canProvideRGBComponents
{
	switch (self.colorSpaceModel)
    {
		case kCGColorSpaceModelRGB:
		case kCGColorSpaceModelMonochrome:
        {
			return YES;
        }
		default:
        {
			return NO;
        }
	}
}

- (BOOL)red:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha
{
	const CGFloat *components = CGColorGetComponents(self.CGColor);
    
	CGFloat r,g,b,a;
    
	switch (self.colorSpaceModel)
    {
		case kCGColorSpaceModelMonochrome:
        {
			r = g = b = components[0];
			a = components[1];
			
            break;
        }
		case kCGColorSpaceModelRGB:
        {
			r = components[0];
			g = components[1];
			b = components[2];
			a = components[3];
			
            break;
        }
		default:
        {
			return NO;
        }
	}
    
	if (red)   *red   = r;
	if (green) *green = g;
	if (blue)  *blue  = b;
	if (alpha) *alpha = a;
    
	return YES;
}

- (UInt32)rgbHex
{
    NSAssert(self.canProvideRGBComponents, @"Must be a RGB color to use rgbHex");
    
    CGFloat r, g, b, a;

    if ( ! [self red:&r green:&g blue:&b alpha:&a])
        return 0;
    
    r = MIN(MAX(r, 0.0f), 1.0f);
    g = MIN(MAX(g, 0.0f), 1.0f);
    b = MIN(MAX(b, 0.0f), 1.0f);
    
    return (((int)roundf(r * 255)) << 16) | (((int)roundf(g * 255)) << 8) | (((int)roundf(b * 255)));
}

#pragma mark -

- (NSString *)hexStringFromColor
{
	return [NSString stringWithFormat:@"%0.6lX", self.rgbHex];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    NSScanner *scanner = [NSScanner scannerWithString:[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""]];
    
    unsigned hexNum;
    
    if ( ! [scanner scanHexInt:&hexNum])
        return nil;
    
    return [UIColor colorWithRGBHex:hexNum];
}

@end