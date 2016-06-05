//
//  UIAlertView+ZLBlock.m
//

#import "UIAlertView+ZLBlock.h"
#import <objc/runtime.h>

#undef  UIAlertView_key_clicked
#define UIAlertView_key_clicked                         "UIAlertView_key_clicked"
#undef  UIAlertView_key_cancel
#define UIAlertView_key_cancel                          "UIAlertView_key_cancel"
#undef  UIAlertView_key_willPresent
#define UIAlertView_key_willPresent                     "UIAlertView_key_willPresent"
#undef  UIAlertView_key_didPresent
#define UIAlertView_key_didPresent                      "UIAlertView_key_didPresent"
#undef  UIAlertView_key_willDismiss
#define UIAlertView_key_willDismiss                     "UIAlertView_key_willDismiss"
#undef  UIAlertView_key_didDismiss
#define UIAlertView_key_didDismiss                      "UIAlertView_key_didDismiss"
#undef  UIAlertView_key_shouldEnableFirstOtherButton
#define UIAlertView_key_shouldEnableFirstOtherButton    "UIAlertView_key_shouldEnableFirstOtherButton"

@implementation UIAlertView (ZLBlock)

- (void)zl_handlerClickedButton:(ZLAlertView_block_self_index)aBlock {
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_clicked, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)zl_handlerCancel:(ZLAlertView_block_self)aBlock {
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_cancel, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)zl_handlerWillPresent:(ZLAlertView_block_self)aBlock {
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_willPresent, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)zl_handlerDidPresent:(ZLAlertView_block_self)aBlock {
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_didPresent, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)zl_handlerWillDismiss:(ZLAlertView_block_self_index)aBlock {
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_willDismiss, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)zl_handlerDidDismiss:(ZLAlertView_block_self_index)aBlock {
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_didDismiss, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)zl_handlerShouldEnableFirstOtherButton:(ZLAlertView_block_shouldEnableFirstOtherButton)aBlock {
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_shouldEnableFirstOtherButton, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ZLAlertView_block_self_index block = objc_getAssociatedObject(self, UIAlertView_key_clicked);

    if (block) {
        block(alertView, buttonIndex);
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    ZLAlertView_block_self block = objc_getAssociatedObject(self, UIAlertView_key_cancel);

    if (block) {
        block(alertView);
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView {
    ZLAlertView_block_self block = objc_getAssociatedObject(self, UIAlertView_key_willPresent);

    if (block) {
        block(alertView);
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
    ZLAlertView_block_self block = objc_getAssociatedObject(self, UIAlertView_key_didPresent);

    if (block) {
        block(alertView);
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    ZLAlertView_block_self_index block = objc_getAssociatedObject(self, UIAlertView_key_willDismiss);

    if (block) {
        block(alertView, buttonIndex);
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    ZLAlertView_block_self_index block = objc_getAssociatedObject(self, UIAlertView_key_didDismiss);

    if (block) {
        block(alertView, buttonIndex);
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    ZLAlertView_block_shouldEnableFirstOtherButton block = objc_getAssociatedObject(self, UIAlertView_key_shouldEnableFirstOtherButton);

    if (block) {
        return block(alertView);
    }

    return YES;
}

@end
