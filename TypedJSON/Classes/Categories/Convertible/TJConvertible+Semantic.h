//
//  TJConvertible+Semantic.h
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 tp. All rights reserved.
//

#import "TJConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJConvertible<__covariant ValueType> (Semantic)

@property (nonatomic, assign) BOOL negation;

/// This operator just return the current convertible instance.
- (TJConvertible<ValueType> *)with;

/// This operator could be used before other condition operators just like `- empty`, to provider negative semantic.
- (TJConvertible<ValueType> *)without;

@end

NS_ASSUME_NONNULL_END
