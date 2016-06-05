//
//  UIButton+ZLEnlarge.h
//

#import <UIKit/UIKit.h>

/// 扩大button点击区域.
@interface UIButton (ZLEnlarge)

- (void)zl_enlarge;
- (void)zl_setEnlarge:(CGFloat)size;
- (void)zl_setEnlargeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
