//
//  NSString+ZLFormat.h
//

#import <Foundation/Foundation.h>

/// 字符串格式化.
@interface NSString (ZLFormat)

/**
 *  去除两端空格和回车.
 *
 *  @return 格式化后的字符串.
 */
- (NSString *)zl_trim;

/**
 *  去掉所有空格.
 *
 *  @return 格式化后的字符串.
 */
- (NSString *)zl_trimSpace;

/**
 *  字符分割数组.
 *
 *  @param array 数组.
 *
 *  @return 字符串.
 */
+ (NSString *)zl_stringFromArray:(NSArray *)array separator:(NSString *)separator;

/**
 *  逗号分割数组.
 *
 *  @param array 数组.
 *
 *  @return 字符串.
 */
+ (NSString *)zl_stringFromArray:(NSArray *)array;

@end
