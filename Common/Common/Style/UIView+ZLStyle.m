//
//  UIView+ZLStyle.m
//

#import "UIView+ZLStyle.h"

@implementation UIView (ZLStyle)
@dynamic zBgColorID;

- (void)setZBgColorID:(NSInteger)zBgColorID {
    self.backgroundColor = [UIColor zl_colorWithID:zBgColorID];
}

@end
