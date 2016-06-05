//
//  UIAlertView+ZLBlock.h
//

#import <UIKit/UIKit.h>

typedef void (^ZLAlertView_block_self_index)(UIAlertView *alertView, NSInteger btnIndex);
typedef void (^ZLAlertView_block_self)(UIAlertView *alertView);
typedef BOOL (^ZLAlertView_block_shouldEnableFirstOtherButton)(UIAlertView *alertView);

/// UIAlertView 支持 Block.
@interface UIAlertView (ZLBlock)

/**
 *  点击事件.
 *
 *  @param aBlock 回调函数.
 */
- (void)zl_handlerClickedButton:(ZLAlertView_block_self_index)aBlock;

- (void)zl_handlerCancel:(ZLAlertView_block_self)aBlock;
- (void)zl_handlerWillPresent:(ZLAlertView_block_self)aBlock;
- (void)zl_handlerDidPresent:(ZLAlertView_block_self)aBlock;
- (void)zl_handlerWillDismiss:(ZLAlertView_block_self_index)aBlock;
- (void)zl_handlerDidDismiss:(ZLAlertView_block_self_index)aBlock;
- (void)zl_handlerShouldEnableFirstOtherButton:(ZLAlertView_block_shouldEnableFirstOtherButton)aBlock;

@end
