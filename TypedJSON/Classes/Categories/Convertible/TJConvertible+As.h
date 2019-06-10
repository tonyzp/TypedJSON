//
//  TJConvertible+As.h
//  TypedJSON
//
//  Created by tp on 2019/5/16.
//

#import "TJConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJConvertible (As)

/// This operator tries to make sure the value type matches the specified class, otherwise return nil.
- (TJConvertible<id> * (^)(Class))as;

@end

NS_ASSUME_NONNULL_END
