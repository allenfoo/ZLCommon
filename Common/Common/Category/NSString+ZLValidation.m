//
//  NSString+ZLValidation.m
//

#import "NSString+ZLValidation.h"

@implementation NSString (ZLValidation)

- (BOOL)zl_validateSecurityCode {
    /// 验证码由数字组成, 长度为6位.
    NSString    *regex     = @"^[0-9]{6}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL        isValid    = [predicate evaluateWithObject:self];
    return isValid;
}

- (BOOL)zl_validatePhone {
    NSString    *regex     = @"^[1][3-9]\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL        isValid    = [predicate evaluateWithObject:self];
    return isValid;
}

- (BOOL)zl_validatePassword {
    /// 密码由数字和字母组成, 长度为6-20位.
    NSString    *regex     = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL        isValid    = [predicate evaluateWithObject:self];
    return isValid;
}

- (BOOL)zl_validateEmail {
    NSString    *regex     = @"[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL        isValid    = [predicate evaluateWithObject:self];
    return isValid;
}

- (BOOL)zl_validateIdentityCard {
    /// 判断位数.
    if ([self length] != 15 && [self length] != 18) {
        return NO;
    }
    NSString *idCard = self;

    long lSumQT = 0;
    /// 加权因子.
    int R[] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };

    /// 校验码.
    unsigned char sChecker[11] = {'1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'};

    /// 将15位身份证号转换成18位.
    NSMutableString *mString = [NSMutableString stringWithString:self];

    if ([self length] == 15) {

        [mString insertString:@"19" atIndex:6];
        long       p    = 0;
        const char *pid = [mString UTF8String];
        for (int i = 0; i <= 16; i++) {
            p += (pid[i]-48) * R[i];
        }

        int      o               = p%11;
        NSString *string_content = [NSString stringWithFormat:@"%c", sChecker[o]];
        [mString insertString:string_content atIndex:[mString length]];
        idCard = mString;
    }

    /// 判断地区码.
    NSString *sProvince = [idCard substringToIndex:2];
    if (![self zl_areaCode:sProvince]) {

        return NO;
    }
    /// 判断年月日是否有效.
    int strYear  = [[idCard substringWithRange:NSMakeRange(6, 4)] intValue];
    int strMonth = [[idCard substringWithRange:NSMakeRange(10, 2)] intValue];
    int strDay   = [[idCard substringWithRange:NSMakeRange(12, 2)] intValue];

    NSTimeZone      *localZone     = [NSTimeZone localTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeZone:localZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01", strYear, strMonth, strDay]];

    if (date == nil) {
        return NO;
    }
    const char *PaperId = [idCard UTF8String];
    /// 检验长度.
    if (18 != strlen(PaperId)) return -1;
    /// 校验数字.
    for (int i = 0; i < 18; i++) {
        if (!isdigit(PaperId[i]) && !(('X' == PaperId[i] || 'x' == PaperId[i]) && 17 == i) ) {
            return NO;
        }
    }
    /// 验证最末的校验码.
    for (int i = 0; i <= 16; i++) {
        lSumQT += (PaperId[i]-48) * R[i];
    }
    if (sChecker[lSumQT%11] != PaperId[17]) {
        return NO;
    }

    return YES;
}

#pragma mark - Private

/**
 *  判断是否在地区码内.
 *
 *  @param code 地区码.
 *
 *  @return YES/NO.
 */
- (BOOL)zl_areaCode:(NSString *)code {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"北京" forKey:@"11"];
    [dic setObject:@"天津" forKey:@"12"];
    [dic setObject:@"河北" forKey:@"13"];
    [dic setObject:@"山西" forKey:@"14"];
    [dic setObject:@"内蒙古" forKey:@"15"];
    [dic setObject:@"辽宁" forKey:@"21"];
    [dic setObject:@"吉林" forKey:@"22"];
    [dic setObject:@"黑龙江" forKey:@"23"];
    [dic setObject:@"上海" forKey:@"31"];
    [dic setObject:@"江苏" forKey:@"32"];
    [dic setObject:@"浙江" forKey:@"33"];
    [dic setObject:@"安徽" forKey:@"34"];
    [dic setObject:@"福建" forKey:@"35"];
    [dic setObject:@"江西" forKey:@"36"];
    [dic setObject:@"山东" forKey:@"37"];
    [dic setObject:@"河南" forKey:@"41"];
    [dic setObject:@"湖北" forKey:@"42"];
    [dic setObject:@"湖南" forKey:@"43"];
    [dic setObject:@"广东" forKey:@"44"];
    [dic setObject:@"广西" forKey:@"45"];
    [dic setObject:@"海南" forKey:@"46"];
    [dic setObject:@"重庆" forKey:@"50"];
    [dic setObject:@"四川" forKey:@"51"];
    [dic setObject:@"贵州" forKey:@"52"];
    [dic setObject:@"云南" forKey:@"53"];
    [dic setObject:@"西藏" forKey:@"54"];
    [dic setObject:@"陕西" forKey:@"61"];
    [dic setObject:@"甘肃" forKey:@"62"];
    [dic setObject:@"青海" forKey:@"63"];
    [dic setObject:@"宁夏" forKey:@"64"];
    [dic setObject:@"新疆" forKey:@"65"];
    [dic setObject:@"台湾" forKey:@"71"];
    [dic setObject:@"香港" forKey:@"81"];
    [dic setObject:@"澳门" forKey:@"82"];
    [dic setObject:@"国外" forKey:@"91"];

    if ([dic objectForKey:code] == nil) {
        return NO;
    }
    return YES;
}

@end
