//
//  TJConvertible+Empty.h
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 tp. All rights reserved.
//

#import "TJConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJConvertible<__covariant ValueType> (Empty)

/// This operator check the value if it is empty (length == 0 or count == 0), then return nil as the final value; this can be use with 'without' operator.
- (TJConvertible<ValueType> *)empty;

@end

NS_ASSUME_NONNULL_END
