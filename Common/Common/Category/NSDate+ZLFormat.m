//
//  NSDate+ZLFormat.m
//

#import "NSDate+ZLFormat.h"

@implementation NSDate (ZLFormat)

- (NSString *)zl_stringWithFormater:(NSString *)formatter {
    return [self zl_stringWithFormater:formatter inEnglish:NO];
}

- (NSString *)zl_stringWithFormater:(NSString *)formatter inEnglish:(BOOL)inEnglish {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    if (inEnglish) {
        // EEE, dd MMM yyyy HH:mm:ss 该格式化只在英文操作系统的环境下才有效.
        dateFormatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    }
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:self];
}

@end
