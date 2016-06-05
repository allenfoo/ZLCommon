//
//  UIFont+ZLStyle.h
//

#import <UIKit/UIKit.h>

/// 枚举数值和 storyboard 对应, 不要随意修改.
typedef enum : NSUInteger {
    ZLFontMainTitle = 1, //!< 大标题.
    ZLFontTitle     = 2, //!< 主标题.
    ZLFontSubtitle  = 3, //!< 副标题.
    ZLFontContent   = 4, //!< 内容.
} ZLFont;

/// 设置统一的字体.
@interface UIFont (ZLStyle)

/**
 *  根据枚举获取对应字体.
 *
 *  @param fontID ZLFont.
 *
 *  @return UIFont.
 */
+ (UIFont *)zl_fontWithID:(ZLFont)fontID;

@end
