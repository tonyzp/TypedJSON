//
//  TJConvertible+Defaults.m
//  TypedJSON
//
//  Created by tp on 2019/5/13.
//

#import "TJConvertible+Defaults.h"

@implementation TJConvertible (Default)

#pragma mark - Public

- (TJConvertible<id> *_Nonnull (^)(id _Nonnull))defaults {
    return ^TJConvertible<id> *(id value) {
        return [TJConvertible create:^id _Nullable {
            return self.value ?: value;
        }];
    };
}

@end
