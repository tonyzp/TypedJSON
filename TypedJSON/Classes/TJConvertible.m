//
//  TJConvertible.m
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 tp. All rights reserved.
//

#import "TJConvertible.h"

@interface TJConvertible ()

- (instancetype)initWithMaker:(TJConvertibleMaker)maker;

@end

@implementation TJConvertible

#pragma mark - Public

+ (instancetype)create:(TJConvertibleMaker)maker {
    return [[self alloc] initWithMaker:maker];
}

- (id)value {
    return _maker();
}

#pragma mark - Private

- (instancetype)initWithMaker:(TJConvertibleMaker)maker {
    self = [super init];
    if (self) {
        _maker = [maker copy];
    }
    return self;
}

@end
