//
//  TJConvertible+As.m
//  TypedJSON
//
//  Created by tp on 2019/5/16.
//

#import "TJConvertible+As.h"

@implementation TJConvertible (As)

#pragma mark - Public

- (TJConvertible<id> * _Nonnull (^)(Class  _Nonnull __unsafe_unretained))as {
    return ^TJConvertible<id> * (Class cls) {
        return [TJConvertible<id> create:^id _Nullable {
            id value = self.value;
            return value && [value isKindOfClass:cls] ? value : nil;
        }];
    };
}

@end
