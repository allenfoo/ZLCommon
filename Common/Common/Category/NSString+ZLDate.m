//
//  NSString+ZLDate.m
//

#import "NSString+ZLDate.h"

@implementation NSString (ZLDate)

- (NSDate *)zl_dateWithFormat:(NSString *)format {
    return [self zl_dateWithFormat:format inEnglish:NO];
}

- (NSDate *)zl_dateWithFormat:(NSString *)format inEnglish:(BOOL)inEnglish {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    formatter.timeZone   = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    if (inEnglish) {
        // EEE, dd MMM yyyy HH:mm:ss 该格式化只在英文操作系统的环境下才有效.
        formatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    }
    return [formatter dateFromString:self];
}

@end
