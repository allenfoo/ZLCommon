//
//  NSDate+ZLFormat.h
//

#import <Foundation/Foundation.h>

/// 日期格式化.
@interface NSDate (ZLFormat)

- (NSString *)zl_stringWithFormater:(NSString *)formatter;
- (NSString *)zl_stringWithFormater:(NSString *)formatter inEnglish:(BOOL)inEnglish;

@end
