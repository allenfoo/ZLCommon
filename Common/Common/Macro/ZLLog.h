//
//  ZLLog.h
//

#ifndef ZLLog_h
#define ZLLog_h

#ifdef DEBUG
// 覆盖 NSLog.
#define NSLog(...) NSLog(__VA_ARGS__)
static const DDLogLevel LOG_LEVEL_DEF = DDLogLevelAll; //!< CocoaLumberjack, 允许所有 DDLog.
// 覆盖 DLog.
#define DLog(fmt, ...)              DDLogInfo(@"Line Number: %d From %@\n%@\n%@",                   \
                                    __LINE__,                                                       \
                                    [[NSString stringWithUTF8String:__FILE__] lastPathComponent],   \
                                    [NSString stringWithUTF8String:__FUNCTION__],                   \
                                    [NSString stringWithFormat:fmt, ##__VA_ARGS__]);
#define DLogError(fmt, ...)         DDLogError(@"Line Number: %d From %@\n%@\n%@",                  \
                                    __LINE__,                                                       \
                                    [[NSString stringWithUTF8String:__FILE__] lastPathComponent],   \
                                    [NSString stringWithUTF8String:__FUNCTION__],                   \
                                    [NSString stringWithFormat:fmt, ##__VA_ARGS__]);
#define DLogWarn(fmt, ...)          DDLogWarn(@"Line Number: %d From %@\n%@\n%@",                   \
                                    __LINE__,                                                       \
                                    [[NSString stringWithUTF8String:__FILE__] lastPathComponent],   \
                                    [NSString stringWithUTF8String:__FUNCTION__],                   \
                                    [NSString stringWithFormat:fmt, ##__VA_ARGS__]);

#else /* NO DEBUG */
// 覆盖 NSLog.
#define NSLog(...)
static const DDLogLevel LOG_LEVEL_DEF = DDLogLevelOff; //!< CocoaLumberjack, 禁用所有 DDLog.
// 覆盖 DLog.
#define DLog(...)
#define DLogError(...)
#define DLogWarn(...)

#endif /* DEBUG */

#endif /* ZLLog_h */
