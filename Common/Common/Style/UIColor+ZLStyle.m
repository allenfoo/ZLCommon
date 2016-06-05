//
//  UIColor+ZLStyle.m
//

#import "UIColor+ZLStyle.h"

/// 颜色.
#define ColorClear  [UIColor clearColor] //!< 背景透明, id = 0.
#define ColorTheme              0xffcc00 //!< 导航条, Global Tint, id = 1.
#define ColorSubTheme           0xff6600 //!< 下划线和字体的颜色, id = 2.
#define ColorBackground         0xf4f4f2 //!< 大多数视图背景, id = 3.
#define ColorLine               0xe5e5e5 //!< 分割线, id = 4.
#define ColorError              0xff0000 //!< 错误警告, id = 5.
#define ColorMainFont           0x333333 //!< 主标题颜色, id = 6.
#define ColorFont               0x666666 //!< 主要的字体颜色, id = 7.
#define ColorSubFont            0x999999 //!< 次要的字体颜色, id = 8.
#define ColorButtonFont         0xffffff //!< 通常是白色, id = 9
#define ColorDisable            0xdcdcdc //!< 控件不可用时的颜色, id = 10.

@implementation UIColor (ZLStyle)

+ (UIColor *)zl_colorWithID:(ZLColor)colorID {
    UIColor *color = nil;
    switch (colorID) {
    case ZLColorClear:
        color = ColorClear;
        break;
    case ZLColorTheme:
        color = [UIColor zl_colorWithRGBHex:ColorTheme];
        break;
    case ZLColorSubTheme:
        color = [UIColor zl_colorWithRGBHex:ColorSubTheme];
        break;
    case ZLColorBackground:
        color = [UIColor zl_colorWithRGBHex:ColorBackground];
        break;
    case ZLColorLine:
        color = [UIColor zl_colorWithRGBHex:ColorLine];
        break;
    case ZLColorError:
        color = [UIColor zl_colorWithRGBHex:ColorError];
        break;
    case ZLColorMainFont:
        color = [UIColor zl_colorWithRGBHex:ColorMainFont];
        break;
    case ZLColorFont:
        color = [UIColor zl_colorWithRGBHex:ColorFont];
        break;
    case ZLColorSubFont:
        color = [UIColor zl_colorWithRGBHex:ColorSubFont];
        break;
    case ZLColorButtonFont:
        color = [UIColor zl_colorWithRGBHex:ColorButtonFont];
        break;
    case ZLColorDisable:
        color = [UIColor zl_colorWithRGBHex:ColorDisable];
        break;
    default:
        color = [UIColor whiteColor];
        break;
    }
    return color;
}

@end
