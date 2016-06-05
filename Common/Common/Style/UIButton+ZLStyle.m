//
//  UIButton+ZLStyle.m
//

#import "UIButton+ZLStyle.h"

@implementation UIButton (ZLStyle)
@dynamic zTextColorID, zFontID;

- (void)setZTextColorID:(NSInteger)zTextColorID {
    [self setTitleColor:[UIColor zl_colorWithID:zTextColorID] forState:UIControlStateNormal];
}

- (void)setZFontID:(NSInteger)zFontID {
    self.titleLabel.font = [UIFont zl_fontWithID:zFontID];
}

- (void)setZBgColorID:(NSInteger)zBgColorID {
    self.backgroundColor = [UIColor zl_colorWithID:zBgColorID];
    [self setBackgroundImage:self.backgroundColor.zImage forState:UIControlStateNormal];
    [self setBackgroundImage:[UIColor zl_highlightedColorFromColor:self.backgroundColor].zImage forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIColor zl_colorWithID:ZLColorDisable].zImage forState:UIControlStateDisabled];
}

@end
