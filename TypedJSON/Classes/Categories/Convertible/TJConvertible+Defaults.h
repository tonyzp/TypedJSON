//
//  TJConvertible+Defaults.h
//  TypedJSON
//
//  Created by tp on 2019/5/13.
//

#import "TJConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJConvertible <__covariant ValueType>(Default)

/// This operator make the specified value as the final value while the previous value is nil.
- (TJConvertible<ValueType> * (^)(ValueType))defaults;

@end

NS_ASSUME_NONNULL_END
