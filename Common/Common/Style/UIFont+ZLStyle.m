//
//  UIFont+ZLStyle.m
//

#import "UIFont+ZLStyle.h"

/// 字号.
#define FontMainTitle           [UIFont systemFontOfSize:20] //!< 40px, 大标题, id = 1.
#define FontTitle               [UIFont systemFontOfSize:15] //!< 30px, 主标题, id = 2.
#define FontSubtitle            [UIFont systemFontOfSize:12] //!< 24px, 副标题, id = 3.
#define FontContent             [UIFont systemFontOfSize:13] //!< 26px, 内容, id = 4.

@implementation UIFont (ZLStyle)

+ (UIFont *)zl_fontWithID:(ZLFont)fontID {
    UIFont *font = nil;
    switch (fontID) {
    case ZLFontMainTitle:
        font = FontMainTitle;
        break;
    case ZLFontTitle:
        font = FontTitle;
        break;
    case ZLFontSubtitle:
        font = FontSubtitle;
        break;
    case ZLFontContent:
        font = FontContent;
        break;
    default:
        font = [UIFont systemFontOfSize:14];
        break;
    }
    return font;
}

@end
