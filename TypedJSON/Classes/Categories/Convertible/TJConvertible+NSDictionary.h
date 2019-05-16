//
//  TJConvertible+NSDictionary.h
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//

#import "TJConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJConvertible<__covariant ValueType> (NSDictionary)

/// This operator tries to get NSString value from the previous value as if it's a dictionary with a specified key. The final value could be nil if type not mathes NSString.
- (TJConvertible<NSString *> * (^)(NSString *))string;

/// This operator tries to get NSNumber value from the previous value as if it's a dictionary with a specified key. The final value could be nil if type not mathes NSNumber.
- (TJConvertible<NSNumber *> * (^)(NSString *))number;

/// This operator tries to get NSArray value from the previous value as if it's a dictionary with a specified key. The final value could be nil if type not mathes NSArray.
- (TJConvertible<NSArray *> * (^)(NSString *))array;

/// This operator tries to get NSDitionary value from the previous value as if it's a dictionary with a specified key. The final value could be nil if type not mathes NSStringNSDitionary
- (TJConvertible<NSDictionary *> * (^)(NSString *))dictionary;

/// This operator tries to get any value from the from the previous value as if it's a dictionary with a specified key. The final value doesn't do the type check.
- (TJConvertible<ValueType> * (^)(NSString *))any;

@end

NS_ASSUME_NONNULL_END
