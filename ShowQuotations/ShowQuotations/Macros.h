//
//  Macros.h
//  ShowQuotations
//
//  Created by zhangkai on 8/11/16.
//  Copyright © 2016 Kai Zhang. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                alpha:1.0]

/*
 * if DEBUG is not defined, or if it is 0 then
 * all DLOGXXX macros will be disabled
 *
 * if DEBUG==1 then:
 * DLOG() will be enabled
 * DLOGERROR() will be enabled
 * DLOGINFO()will be disabled
 *
 * if DEBUG==2 or higher then:
 * DLOG() will be enabled
 * DLOGERROR() will be enabled
 * DLOGINFO()will be enabled
 */
#if !defined(DEBUG) || DEBUG == 0
#define DLOG(format, ...) do {} while (0)
#define DLOGINFO(format, ...) do {} while (0)
#define DLOGERROR(format, ...) do {} while (0)

#elif DEBUG == 1
#define DLOG(format, ...) NSLog((@"%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define DLOGERROR(format, ...) NSLog((@"%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define DLOGINFO(format, ...) do {} while (0)

#elif DEBUG > 1
#define DLOG(format, ...) NSLog((@"%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define DLOGERROR(format, ...) NSLog((@"%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define DLOGINFO(format, ...) NSLog((@"%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#endif

#endif /* Macros_h */
