//
//  TJConvertible+Find.h
//  TypedJSON
//
//  Created by tp on 2019/5/15.
//

#import "TJConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJConvertible<__covariant ValueType> (Find)

/// This operator tries to find the value with the specified key resursively, the return value doesn't do the type check, so it could be an any.
- (TJConvertible<ValueType> * (^)(NSString *))find;

@end

NS_ASSUME_NONNULL_END
