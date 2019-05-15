//
//  TJConvertible.h
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 tp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TJConvertible<__covariant ValueType> : NSObject

typedef ValueType _Nullable (^TJConvertibleMaker)(void);

@property (nonatomic, copy, readonly) TJConvertibleMaker maker;

+ (instancetype)create:(TJConvertibleMaker)maker;

- (ValueType)value;

@end

NS_ASSUME_NONNULL_END
