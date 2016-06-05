//
//  NSString+ZLEncoding.m
//

#import "NSString+ZLEncoding.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (ZLEncoding)

- (NSString *)zl_md5By16Encoding {
    const char    *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];

    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *str = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];

    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        if (i > 3 && i < 12) {
            [str appendFormat:@"%02x", result[i]];
        }
    }

    return str;
}

- (NSString *)zl_md5By32Encoding {
    const char    *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];

    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *str = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];

    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [str appendFormat:@"%02x", result[i]];
    }

    return str;
}

- (NSString *)zl_md5By32CapitalEncoding {
    return [self zl_md5By32Encoding].uppercaseString;
}

@end
