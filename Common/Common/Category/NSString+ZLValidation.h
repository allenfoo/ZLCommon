//
//  NSString+ZLValidation.h
//

#import <Foundation/Foundation.h>

/// 字符串验证: 验证手机号, 验证密码, 验证身份证, 验证邮箱.
@interface NSString (ZLValidation)

/**
 *  验证手机号.
 *
 *  @return YES/NO.
 */
- (BOOL)zl_validatePhone;

/**
 *  验证密码.
 *
 *  @return YES/NO.
 */
- (BOOL)zl_validatePassword;

/**
 *  验证身份证.
 *
 *  @return YES/NO.
 */
- (BOOL)zl_validateIdentityCard;

/**
 *  验证邮箱.
 *
 *  @return YES/NO.
 */
- (BOOL)zl_validateEmail;

/**
 *  验证短信验证码.
 *
 *  @return YES/NO.
 */
- (BOOL)zl_validateSecurityCode;

@end
