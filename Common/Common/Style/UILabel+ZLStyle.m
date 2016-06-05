//
//  UILabel+ZLStyle.m
//

#import "UILabel+ZLStyle.h"

@implementation UILabel (ZLStyle)
@dynamic zTextColorID, zFontID;

- (void)setZTextColorID:(NSInteger)zTextColorID {
    self.textColor = [UIColor zl_colorWithID:zTextColorID];
}

- (void)setZFontID:(NSInteger)zFontID {
    self.font = [UIFont zl_fontWithID:zFontID];
}

@end
