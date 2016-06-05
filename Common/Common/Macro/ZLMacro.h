//
//  ZLMacro.h
//

#ifndef ZLMacro_h
#define ZLMacro_h

#pragma mark - Device Info

#define ZLScreenHeight    [UIScreen mainScreen].bounds.size.height    //!< 屏幕高度.
#define ZLScreenWidth     [UIScreen mainScreen].bounds.size.width     //!< 屏幕宽度.

#define ZLIOS7            ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 &&    \
                            [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)
#define ZLIOS8            ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 &&    \
                            [[[UIDevice currentDevice] systemVersion] floatValue] < 9.0)
#define ZLIOS7Later       ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define ZLIOS8Later       ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define ZLIOS9Later       ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#pragma mark - Tools

#define ZLNull(obj)       (!obj || [obj isEqual:@""] || [obj isEqual:[NSNull null]])  //!< 判断对象是否为空.
#define ZLNotNull(obj)    (obj && ![obj isEqual:@""] && ![obj isEqual:[NSNull null]])

/// 使用了 MJExtension 的 'objectWithKeyValues:'.
#define ZLUserDefaultsObject(key, type) [type objectWithKeyValues: ZLUserDefaultsGet(key)]
/// UserDefaults get set.
#define ZLUserDefaultsGet(key)              [[NSUserDefaults standardUserDefaults] objectForKey: key]
#define ZLUserDefaultsSet(key, value)       [[NSUserDefaults standardUserDefaults] setObject: value forKey: key];   \
                                            [[NSUserDefaults standardUserDefaults] synchronize];
#define ZLUserDefaultsDel(key)              [[NSUserDefaults standardUserDefaults] removeObjectForKey: key];        \
                                            [[NSUserDefaults standardUserDefaults] synchronize];

/// UIStoryboard 快速获取.
#define ZLStoryboardFirstController(name)   [UIStoryboard storyboardWithName: name bundle: nil].instantiateInitialViewController
#define ZLStoryboardAnyController(name, id) [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier: id]

/// Xib 快速获取.
#define ZLNibView(name)                     [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] firstObject]

/**
 *  单例 - A handy macro to declare method(s) for a singleton class.
 *
 *  To use this add the line `DeclareSingleton(class name)` in the class definition.
 *  Then put the `ImplementSingleton (class name)` macro along with the class's implementation code.
 */
#define ZLDeclareSingleton(ClassName)                   \
    + (ClassName *)instance;                            \
    + (void)clearInstance;

#define ZLImplementSingleton(ClassName)                 \
    static ClassName * instance;                        \
    + (ClassName *)instance                             \
    {                                                   \
        @synchronized(self) {                           \
            if (!instance) {                            \
                instance = [[ClassName alloc] init];    \
            }                                           \
        }                                               \
        return instance;                                \
    }                                                   \
    + (void)clearInstance                               \
    {                                                   \
        @synchronized(self) {                           \
            if (instance) {                             \
                instance = nil;                         \
            }                                           \
        }                                               \
    }

/// 常量.
#define ZLDurationAnimate         0.5                     //!< 动画时间, 有不同的请在所用类的体文件定义.
#define ZLFormatDate              @"yyyy-MM-dd HH:mm:ss"  //!< 常用的时间格式.
#define ZLLineHeight              0.5                     //!< 分割线, 高.

#endif /* ZLMacro_h */
