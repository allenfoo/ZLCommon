//
//  NSDate+ZLCalendar.h
//

#import <Foundation/Foundation.h>

/// 日历.
@interface NSDate (ZLCalendar)

- (NSDate *)zl_firstDateOfTheMonth;
- (NSDate *)zl_lastDateOfTheMonth;

- (NSDate *)zl_dateOfCurrentMonthAtIdx:(NSInteger)idx;
- (NSDate *)zl_firstDateAfterMonthes:(NSInteger)count;

/**
 *  这个标准化是把后面的 时分秒归零为00:00:00.
 *
 *  @return 返回的时分秒归零为00:00:00.
 */
- (NSDate *)zl_standardizationDate;

- (NSDate *)zl_dateByAddingdays:(NSInteger)dayCount;
- (NSDate *) zl_firstDateOfPrevMonth;
- (NSDate *) zl_firstDateOfNextMonth;
- (NSInteger)zl_monthesToDate:(NSDate *)toDate;
+ (NSInteger)zl_numberOfDaysInMonthForDate:(NSDate *)fromDate;

- (NSDateComponents *)zl_components;
- (NSInteger)         zl_day;
- (NSInteger)         zl_weekDay;
- (NSInteger)         zl_month;
- (NSInteger)         zl_year;

- (BOOL)zl_isYMDEqualToDate:(NSDate *)date;

/**
 *  这个比较也是忽略时分秒的.
 *
 *  @param date 日期.
 *
 *  @return YES表示传入日期晚.
 */
- (BOOL)zl_isBeforeDate:(NSDate *)date;

- (NSString *)zl_monthString;
- (NSInteger) zl_daysFromDate:(NSDate *)date;

@end
