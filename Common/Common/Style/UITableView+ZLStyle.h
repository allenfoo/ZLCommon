//
//  UITableView+ZLStyle.h
//

#import <UIKit/UIKit.h>

/// UITableView 分割线颜色, 仅用于 storyboard 设置.
@interface UITableView (ZLStyle)

@property (nonatomic, assign) IBInspectable NSInteger zLineColorID; //!< 分割线 ID, 如果未生效, 在 storyboard 中设置 separator 为 Default.

@end
