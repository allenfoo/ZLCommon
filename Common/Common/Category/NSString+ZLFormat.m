//
//  NSString+ZLFormat.m
//

#import "NSString+ZLFormat.h"

@implementation NSString (ZLFormat)

- (NSString *)zl_trim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (NSString *)zl_trimSpace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+ (NSString *)zl_stringFromArray:(NSArray *)array separator:(NSString *)separator {
    NSMutableString *str = nil;
    for (id obj in array) {
        if (str == nil) {
            str = [NSMutableString stringWithFormat:@"%@", obj];
        } else {
            [str appendFormat:@"%@%@", separator, obj];
        }
    }
    return str;
}

+ (NSString *)zl_stringFromArray:(NSArray *)array {
    return [NSString zl_stringFromArray:array separator:@","];
}

@end
