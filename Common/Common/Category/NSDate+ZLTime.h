//
//  NSDate+ZLTime.h
//  app
//
//  Created by FuZhuli on 15/10/21.

//

#import <Foundation/Foundation.h>

/// 时, 分, 秒.
@interface NSDate (ZLTime)

- (NSDateComponents *)zl_timeComponents;

- (NSInteger)zl_hour;
- (NSInteger)zl_minute;
- (NSInteger)zl_second;

- (NSDate *)zl_dateAfterHour:(NSInteger)hour;

@end
