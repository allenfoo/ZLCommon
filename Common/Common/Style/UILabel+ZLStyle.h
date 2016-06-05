//
//  UILabel+ZLStyle.h
//

#import <UIKit/UIKit.h>

/// Label 字体和颜色, 仅用于 storyboard 设置.
@interface UILabel (ZLStyle)

@property (nonatomic, assign) IBInspectable NSInteger zTextColorID; //!< 字体颜色 ID.
@property (nonatomic, assign) IBInspectable NSInteger zFontID; //!< 字体 ID.

@end
