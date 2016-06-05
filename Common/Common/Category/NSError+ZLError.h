//
//  NSError+ZLError.h
//

#import <Foundation/Foundation.h>

/// 服务端定的 error 结构.
@interface NSError (ZLError)

@property (nonatomic, readonly) NSInteger zErrorStatus; //!< 同HTTP code.
@property (nonatomic, readonly) NSString  *zErrorTitle; //!< 错误显示信息.
@property (nonatomic, readonly) NSString  *zErrorCode; //!< 错误文字标识.

+ (NSString *)zl_keyErrorStatus;
+ (NSString *)zl_keyErrorTitle;
+ (NSString *)zl_keyErrorCode;

@end
