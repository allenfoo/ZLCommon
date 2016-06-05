//
//  UITableView+ZLStyle.m
//

#import "UITableView+ZLStyle.h"

@implementation UITableView (ZLStyle)
@dynamic zLineColorID;

- (void)setZLineColorID:(NSInteger)zLineColorID {
    self.separatorColor = [UIColor zl_colorWithID:zLineColorID];
}

@end
