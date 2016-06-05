//
//  NSError+ZLError.m
//

#import "NSError+ZLError.h"

#define KeyErrorTitle           @"KeyErrorTitle"
#define KeyErrorStatus          @"KeyErrorStatus"
#define KeyErrorCode            @"KeyErrorCode"

@implementation NSError (ZLError)

- (NSInteger)zErrorStatus {
    return [self.userInfo[KeyErrorStatus] integerValue];
}

- (NSString *)zErrorTitle {
    return self.userInfo[KeyErrorTitle];
}

- (NSString *)zErrorCode {
    return self.userInfo[KeyErrorCode];
}

+ (NSString *)zl_keyErrorStatus {
    return KeyErrorStatus;
}

+ (NSString *)zl_keyErrorTitle {
    return KeyErrorTitle;
}

+ (NSString *)zl_keyErrorCode {
    return KeyErrorCode;
}

@end
