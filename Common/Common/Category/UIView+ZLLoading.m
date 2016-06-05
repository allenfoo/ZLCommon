//
//  UIView+ZLLoading.m
//

#import "UIView+ZLLoading.h"

#import "MBProgressHUD.h"

@implementation UIView (ZLLoading)

- (void)zl_showtips:(NSString *)tips {
    [self zl_showtips:tips afterDelay:1.0];
}

- (void)zl_showtips:(NSString *)tips afterDelay:(NSTimeInterval)delay {
    if (ZLNull(tips)) {
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.cornerRadius = 5;

    /// Configure for text only and offset down.
    hud.mode                      = MBProgressHUDModeText;
    hud.labelText                 = tips;
    hud.margin                    = 10.f;
    hud.removeFromSuperViewOnHide = YES;

    [hud hide:YES afterDelay:delay];
}

- (void)zl_showWarningtips:(NSString *)tips {
    [self zl_showWarningtips:tips afterDelay:1.0];
}

- (void)zl_showWarningtips:(NSString *)tips afterDelay:(NSTimeInterval)delay {
    if (ZLNull(tips)) {
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.cornerRadius = 5;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"无网络连接"]];
    
    hud.mode                      = MBProgressHUDModeCustomView;
    hud.labelText                 = tips;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:delay];
}

- (void)zl_showHUDWithTitle:(NSString *)title {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    hud.detailsLabelText = title;
    [hud show:YES];
}

- (void)zl_showHUD {
    [self zl_showHUDWithTitle:@""];
}

- (void)zl_hideHUD {
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
}

@end
