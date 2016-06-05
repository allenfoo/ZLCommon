//
//  UIButton+ZLStyle.h
//

#import <UIKit/UIKit.h>

/// Button 字体和字体颜色, 仅用于 storyboard 设置.
@interface UIButton (ZLStyle)

@property (nonatomic, assign) IBInspectable NSInteger zTextColorID;  //!< 字体颜色 ID.
@property (nonatomic, assign) IBInspectable NSInteger zFontID;       //!< 字体 ID.

@end
