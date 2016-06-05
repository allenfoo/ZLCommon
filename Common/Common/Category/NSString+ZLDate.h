//
//  NSString+ZLDate.h
//

#import <Foundation/Foundation.h>

/// 日期格式化.
@interface NSString (ZLDate)

- (NSDate *)zl_dateWithFormat:(NSString *)format;
- (NSDate *)zl_dateWithFormat:(NSString *)format inEnglish:(BOOL)inEnglish;

@end
