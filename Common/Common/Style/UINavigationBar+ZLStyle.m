//
//  UINavigationBar+ZLStyle.m
//

#import "UINavigationBar+ZLStyle.h"

@implementation UINavigationBar (ZLStyle)
@dynamic zBarColorID;

- (void)setZBarColorID:(NSInteger)zBarColorID {
    self.barTintColor = [UIColor zl_colorWithID:zBarColorID];
}

@end
