//
//  UIImage+ZLScale.m
//

#import "UIImage+ZLScale.h"

@implementation UIImage (ZLScale)

- (UIImage *)zl_transformWidth:(CGFloat)width height:(CGFloat)height {
    int intDestW   = width + 0.5;
    int intDestH   = height + 0.5;
    int intSourceW = width + 0.5;
    int intSourceH = height + 0.5;

    CGFloat destW   = intDestW;
    CGFloat destH   = intDestH;
    CGFloat sourceW = intSourceW;
    CGFloat sourceH = intSourceH;

    CGImageRef imageRef    = self.CGImage;
    int        bytesPerRow = destW * (CGImageGetBitsPerPixel(imageRef) >> 3);

    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                destW,
                                                destH,
                                                CGImageGetBitsPerComponent(imageRef),
                                                bytesPerRow,
                                                CGImageGetColorSpace(imageRef),
                                                CGImageGetBitmapInfo(imageRef));

    CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);

    CGImageRef ref     = CGBitmapContextCreateImage(bitmap);
    UIImage    *result = [UIImage imageWithCGImage:ref];
    CGContextRelease(bitmap);
    CGImageRelease(ref);

    return result;
}

- (double)zl_ratioForImageToScaleWithMaxWidthOrHeight:(CGFloat)widthOrHeight {
    double ratio = 1;

    CGFloat sourceW = self.size.width;
    CGFloat sourceH = self.size.height;

    if (sourceW <= widthOrHeight && sourceH <= widthOrHeight) {

    } else {
        double ratioX = sourceW / widthOrHeight;
        double ratioY = sourceH / widthOrHeight;

        ratio = ratioX > ratioY ? ratioX : ratioY;
    }

    return ratio;
}

- (UIImage *)zl_transformWithRatio:(double)ratio {
    UIImage *sourceImage = self;

    if (ratio > 1) {
        CGFloat destW = sourceImage.size.width / ratio;
        CGFloat destH = sourceImage.size.height / ratio;
        sourceImage = [self zl_transformWidth:destW height:destH];
    }

    return sourceImage;
}

- (UIImage *)zl_transformWithMaxWidthOrHeight:(CGFloat)widthOrHeight {
    double ratio = [self zl_ratioForImageToScaleWithMaxWidthOrHeight:widthOrHeight];
    return [self zl_transformWithRatio:ratio];
}

@end
