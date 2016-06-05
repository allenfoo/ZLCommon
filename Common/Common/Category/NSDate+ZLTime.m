//
//  NSDate+ZLTime.m
//

#import "NSDate+ZLTime.h"

@implementation NSDate (ZLTime)

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

- (NSDateComponents *)zl_timeComponents {
    return [[NSDate zl_calendar] components:(NSCalendarUnitHour |  NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:self];
}

- (NSInteger)zl_hour {
    NSDateComponents *components = [[NSDate zl_calendar] components:(NSCalendarUnitHour) fromDate:self];
    return components.hour;
}

- (NSInteger)zl_minute {
    NSDateComponents *comps = [[NSDate zl_calendar] components:NSCalendarUnitMinute fromDate:self];
    return comps.minute;
}

- (NSInteger)zl_second {
    NSDateComponents *components = [[NSDate zl_calendar] components:(NSCalendarUnitSecond) fromDate:self];
    return components.second;
}

- (NSDate *)zl_dateAfterHour:(NSInteger)hour {
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.hour = hour;
    return [[NSDate zl_calendar] dateByAddingComponents:components toDate:self options:0];
}

@end
