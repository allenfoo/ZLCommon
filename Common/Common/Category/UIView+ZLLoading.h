//
//  UIView+ZLLoading.h
//

#import <UIKit/UIKit.h>

/// Loading 界面.
@interface UIView (ZLLoading)

/**
 *  replace alertView.
 *
 *  @param tips tips will show to user.
 */
- (void)zl_showtips:(NSString *)tips;
- (void)zl_showtips:(NSString *)tips afterDelay:(NSTimeInterval)delay;
- (void)zl_showWarningtips:(NSString *)tips;
- (void)zl_showWarningtips:(NSString *)tips afterDelay:(NSTimeInterval)delay;

/**
 *  When some operation need user to wait,use this method to show a HDU.
 *
 *  @param title will show to user.
 */
- (void)zl_showHUDWithTitle:(NSString *)title;
- (void)zl_showHUD;
- (void)zl_hideHUD;

@end
