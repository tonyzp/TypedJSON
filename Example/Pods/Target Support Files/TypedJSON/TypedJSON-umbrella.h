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

#import "TJConvertible+Defaults.h"
#import "TJConvertible+Empty.h"
#import "TJConvertible+NSDictionary.h"
#import "TJConvertible+Semantic.h"
#import "NSDictionary+TJCompatible.h"
#import "TJCompatible.h"
#import "TJConvertible.h"
#import "TypedJSON.h"

FOUNDATION_EXPORT double TypedJSONVersionNumber;
FOUNDATION_EXPORT const unsigned char TypedJSONVersionString[];

