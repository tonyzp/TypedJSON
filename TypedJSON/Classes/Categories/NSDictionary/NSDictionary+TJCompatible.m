//
//  NSDictionary+TJCompatible.m
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 tp. All rights reserved.
//

#import "NSDictionary+TJCompatible.h"

@implementation NSDictionary (TJCompatible)

#pragma mark - TJCompatible

- (TJConvertible *)tj {
    return [TJConvertible<NSDictionary *> create:^NSDictionary * _Nullable{
        return self;
    }];
}

@end
