//
//  UIColor+ZLColor.h
//

#import <UIKit/UIKit.h>

/// 颜色转换.
@interface UIColor (ZLColor)

@property (nonatomic, readonly) UIImage *zImage;

+ (UIColor *)zl_colorWithRGBHex:(UInt32)hex;
+ (UIColor *)zl_colorWithARGBHex:(UInt32)hex;

+ (UIColor *)zl_highlightedColor:(UInt32)hex;
+ (UIColor *)zl_highlightedColorFromColor:(UIColor *)color;

@end
