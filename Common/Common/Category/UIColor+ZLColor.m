//
//  UIColor+ZLColor.m
//

#import "UIColor+ZLColor.h"

@implementation UIColor (ZLColor)

- (UIImage *)zImage {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIColor *)zl_colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;

    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

+ (UIColor *)zl_colorWithARGBHex:(UInt32)hex {
    int a = (hex >> 24) & 0xFF;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;

    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:a / 255.0f];
}

+ (UIColor *)zl_highlightedColor:(UInt32)hex {
    return [[UIColor zl_colorWithRGBHex:hex] zl_colorByMultiplyingBy:0.8];
}

+ (UIColor *)zl_highlightedColorFromColor:(UIColor *)color {
    return [color zl_colorByMultiplyingBy:0.8];
}

- (UIColor *)zl_colorByMultiplyingBy:(CGFloat)f {
    return [self zl_colorByMultiplyingByRed:f green:f blue:f alpha:1.0f];
}

- (UIColor *)zl_colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    NSAssert([self zl_canProvideRGBComponents], @"Must be a RGB color to use arithmatic operations");
    
    CGFloat r, g, b, a;
    if (![self zl_red:&r green:&g blue:&b alpha:&a]) return nil;
    
    return [UIColor colorWithRed:MAX(0.0, MIN(1.0, r * red))
                           green:MAX(0.0, MIN(1.0, g * green))
                            blue:MAX(0.0, MIN(1.0, b * blue))
                           alpha:MAX(0.0, MIN(1.0, a * alpha))];
}

- (CGColorSpaceModel)colorSpaceModel {
    return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

- (BOOL)zl_canProvideRGBComponents {
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelRGB:
            
        case kCGColorSpaceModelMonochrome:
            return YES;
            
        default:
            return NO;
    }
}

- (BOOL)zl_red:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    CGFloat r, g, b, a;
    
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelMonochrome:
            r = g = b = components[0];
            a = components[1];
            break;
            
        case kCGColorSpaceModelRGB:
            r = components[0];
            g = components[1];
            b = components[2];
            a = components[3];
            break;
            
        default:
            /// We don't know how to handle this model.
            return NO;
    }
    
    if (red) *red = r;
    if (green) *green = g;
    if (blue) *blue = b;
    if (alpha) *alpha = a;
    
    return YES;
}

@end
