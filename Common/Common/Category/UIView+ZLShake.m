//
//  UIView+ZLShake.m
//

#import "UIView+ZLShake.h"

@implementation UIView (ZLShake)

- (void)zl_showShakeAnimation {
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    shake.duration     = 0.1;
    shake.repeatCount  = 2;
    shake.autoreverses = true;

    CGPoint fromPoint = CGPointMake(self.center.x - 2, self.center.y);
    CGPoint toPoint   = CGPointMake(self.center.x + 2, self.center.y);

    shake.fromValue = [NSValue valueWithCGPoint:fromPoint];
    shake.toValue   = [NSValue valueWithCGPoint:toPoint];
    [self.layer addAnimation:shake forKey:@"position"];
}

@end
