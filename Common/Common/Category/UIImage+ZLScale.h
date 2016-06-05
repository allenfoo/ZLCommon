//
//  UIImage+ZLScale.h
//

#import <UIKit/UIKit.h>

/// 图片尺寸转换.
@interface UIImage (ZLScale)

- (UIImage *)zl_transformWidth:(CGFloat)width height:(CGFloat)height;
- (double)zl_ratioForImageToScaleWithMaxWidthOrHeight:(CGFloat)widthOrHeight;
- (UIImage *)zl_transformWithRatio:(double)ratio;
- (UIImage *)zl_transformWithMaxWidthOrHeight:(CGFloat)widthOrHeight;

@end
