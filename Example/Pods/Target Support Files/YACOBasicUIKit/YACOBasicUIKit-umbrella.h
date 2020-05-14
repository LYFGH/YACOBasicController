#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YACOBasicUIKit.h"
#import "UIApplication+YACOApplication.h"
#import "UIColor+YACOColor.h"
#import "UIDevice+YACODevice.h"
#import "UIFont+YACOFont.h"
#import "UILabel+YACOLabel.h"
#import "YACOAutoScrollLabel.h"
#import "UIView+YACOFrame.h"

FOUNDATION_EXPORT double YACOBasicUIKitVersionNumber;
FOUNDATION_EXPORT const unsigned char YACOBasicUIKitVersionString[];

