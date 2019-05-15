//
//  TJConvertible+Semantic.h
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 tp. All rights reserved.
//

#import "TJConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJConvertible (Semantic)

@property (nonatomic, assign) BOOL negation;

- (TJConvertible *)with;

- (TJConvertible *)without;

@end

NS_ASSUME_NONNULL_END
