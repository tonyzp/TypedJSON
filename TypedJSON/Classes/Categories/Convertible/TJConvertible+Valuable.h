//
//  TJConvertible+Valuable.h
//  TypedJSON
//
//  Created by tp on 2019/5/15.
//

#import "TJConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJConvertible (Valuable)

/// Call `- value` method and do type check with NSString.
- (nullable NSString *)stringValue;

/// Call `- value` method and do type check with NSNumber.
- (nullable NSNumber *)numberValue;

/// Call `- value` method and do type check with NSArray.
- (nullable NSArray *)arrayValue;

/// Call `- value` method and do type check with NSDictionary.
- (nullable NSDictionary *)dictionaryValue;

@end

NS_ASSUME_NONNULL_END
