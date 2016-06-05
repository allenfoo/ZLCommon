//
//  NSString+ZLEncoding.h
//

#import <Foundation/Foundation.h>

/// 字符串加密.
@interface NSString (ZLEncoding)

- (NSString *)zl_md5By16Encoding;
- (NSString *)zl_md5By32Encoding;
- (NSString *)zl_md5By32CapitalEncoding;

@end
