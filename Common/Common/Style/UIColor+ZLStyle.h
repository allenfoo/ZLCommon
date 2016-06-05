//
//  UIColor+ZLStyle.h
//

#import <UIKit/UIKit.h>

/// 枚举数值和 storyboard 对应, 不要随意修改.
typedef enum : NSUInteger {
    ZLColorClear      = 0,  //!< 背景透明.
    ZLColorTheme      = 1,  //!< 导航条, Global Tint.
    ZLColorSubTheme   = 2,  //!< 下划线和字体的颜色.
    ZLColorBackground = 3,  //!< 大多数视图背景.
    ZLColorLine       = 4,  //!< 分割线.
    ZLColorError      = 5,  //!< 错误警告.
    ZLColorMainFont   = 6,  //!< 主标题颜色.
    ZLColorFont       = 7,  //!< 主要的字体颜色.
    ZLColorSubFont    = 8,  //!< 次要的字体颜色.
    ZLColorButtonFont = 9,  //!< 带背景的 button 的字体颜色, 通常是白色.
    ZLColorDisable    = 10, //!< 控件不可用时的颜色.
} ZLColor;

/// 设置统一的颜色.
@interface UIColor (ZLStyle)

/**
 *  根据枚举获取对应颜色.
 *
 *  @param colorID ZLColor.
 *
 *  @return UIColor.
 */
+ (UIColor *)zl_colorWithID:(ZLColor)colorID;

@end
