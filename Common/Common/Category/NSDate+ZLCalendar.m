//
//  NSDate+ZLCalendar.m
//

#import "NSDate+ZLCalendar.h"

@implementation NSDate (ZLCalendar)

+ (NSCalendar *)zl_calendar {
    static NSCalendar *cal;
    if (nil == cal) {
        /**
         *  change to the first day in a month.
         *  we need to set the time zone to 'GMT', otherwise, the date will not right(one day offset).
         */
        cal = [NSCalendar currentCalendar];
        [cal setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    }
    return cal;
}

- (NSDate *)zl_firstDateOfTheMonth {
    NSDateComponents *comps = [[NSDate zl_calendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    [comps setDay:1];
    NSDate *firstDayOfMonthDate = [[NSDate zl_calendar] dateFromComponents:comps];
    return firstDayOfMonthDate;
}

- (NSDate *)zl_lastDateOfTheMonth {
    NSDateComponents *comps = [[NSDate zl_calendar]components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];

    NSInteger dayOfMonthCount = 31;

    if (comps.month == 2) {
        if ([self zl_isLeapYear:comps.year]) {
            dayOfMonthCount = 29;
        } else {
            dayOfMonthCount = 28;
        }
    } else if (comps.month == 4 || comps.month == 6 || comps.month == 9 || comps.month == 11) {
        dayOfMonthCount = 30;
    }

    [comps setDay:dayOfMonthCount];
    [comps setHour:23];
    [comps setMinute:59];
    [comps setSecond:59];
    NSDate *lastDateOfTheMonth = [[NSDate zl_calendar] dateFromComponents:comps];
    return lastDateOfTheMonth;
}

- (NSDate *)zl_dateOfCurrentMonthAtIdx:(NSInteger)idx {
    NSDate           *firstDate  = [self zl_firstDateOfTheMonth];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = idx;

    return [[NSDate zl_calendar] dateByAddingComponents:components toDate:firstDate options:0];
}

- (NSDate *)zl_firstDateAfterMonthes:(NSInteger)count {
    NSDate           *firstDate  = [self zl_firstDateOfTheMonth];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = count;

    return [[NSDate zl_calendar] dateByAddingComponents:components toDate:firstDate options:0];
}

- (NSInteger)zl_monthesToDate:(NSDate *)toDate {
    if (toDate == nil)
        return 0;

    NSDateComponents *components = [[NSDate zl_calendar] components:NSCalendarUnitMonth fromDate:[self zl_firstDateOfTheMonth]  toDate:[toDate zl_firstDateOfTheMonth] options:0];
    return components.month;
}

- (NSDateComponents *)zl_components {
    return [[NSDate zl_calendar] components:(NSCalendarUnitMonth |  NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:self];
}

- (NSInteger)zl_day {
    NSDateComponents *components = [[NSDate zl_calendar] components:(NSCalendarUnitDay) fromDate:self];
    return components.day;
}

- (NSInteger)zl_weekDay {
    NSDateComponents *comps = [[NSDate zl_calendar] components:NSCalendarUnitWeekday fromDate:self];
    return [comps weekday] - 1;
}

- (NSInteger)zl_month {
    NSDateComponents *components = [[NSDate zl_calendar] components:(NSCalendarUnitMonth) fromDate:self];
    return components.month;
}

- (NSInteger)zl_year {
    NSDateComponents *components = [[NSDate zl_calendar] components:(NSCalendarUnitYear) fromDate:self];
    return components.year;
}

- (BOOL)zl_isYMDEqualToDate:(NSDate *)date {
    if (date == nil)
        return NO;

    NSDateComponents *c1 = [self zl_components];
    NSDateComponents *c2 = [date zl_components];

    return (c1.year == c2.year && c1.month == c2.month && c1.day == c2.day);
}

- (BOOL)zl_isBeforeDate:(NSDate *)date {
    NSDate *d1 = [self zl_standardizationDate];
    NSDate *d2 = [date zl_standardizationDate];

    NSDateComponents *c3 = [[NSDate zl_calendar] components:NSCalendarUnitDay fromDate:d1 toDate:d2 options:0];
    return (c3.day > 0);
}

- (NSString *)zl_monthString {
    NSInteger monthIdx = [self zl_month];

    NSArray *months = @[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月", ];

    return months[monthIdx - 1];
}

- (NSDate *)zl_firstDateOfPrevMonth {
    return [self zl_firstDateAfterMonthes:-1];
}

- (NSDate *)zl_firstDateOfNextMonth {
    return [self zl_firstDateAfterMonthes:+1];
}

/// return the days in a month.
+ (NSInteger)zl_numberOfDaysInMonthForDate:(NSDate *)fromDate {
    NSRange range = [[NSDate zl_calendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:fromDate];
    return range.length;
}

- (NSDate *)zl_dateByAddingdays:(NSInteger)dayCount {
    NSDate *dt = [self zl_standardizationDate];

    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = dayCount;

    return [[NSDate zl_calendar] dateByAddingComponents:components toDate:dt options:0];
}

- (NSDate *)zl_standardizationDate {
    NSDateComponents *c1 = [self zl_components];
    NSDate           *d1 = [self zl_dateFromYear:c1.year month:c1.month day:c1.day];

    return d1;
}

- (NSInteger)zl_daysFromDate:(NSDate *)date {
    NSDateComponents *comps = [[NSDate zl_calendar] components:NSCalendarUnitDay fromDate:date toDate:self options:NSCalendarWrapComponents];
    NSInteger        days   = comps.day;
    return days;
}

#pragma mark - private

- (NSDate *)zl_dateFromYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone   = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";

    NSString *dateStr = [NSString stringWithFormat:@"%d-%02d-%02d 00:00:00", (int)year, (int)month, (int)day];

    return [formatter dateFromString:dateStr];
}

- (BOOL)zl_isLeapYear:(NSInteger)year {
    BOOL isLeapYear;
    if (year % 100) {
        isLeapYear = (year % 400) ? NO : YES;
    } else {
        isLeapYear = (year % 4) ? NO : YES;
    }
    return isLeapYear;
}

@end
