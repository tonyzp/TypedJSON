//
//  TJConvertible+NSDictionary.m
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//

#import "TJConvertible+NSDictionary.h"
#import "TJConvertible+Valuable.h"

@implementation TJConvertible (NSDictionary)

#pragma mark - Public

- (TJConvertible<NSString *> * _Nonnull (^)(NSString * _Nonnull))string {
    return [self makeDictionaryAccessorConvertibleBlockWith:NSString.class];
}

- (TJConvertible<NSNumber *> * _Nonnull (^)(NSString * _Nonnull))number {
    return [self makeDictionaryAccessorConvertibleBlockWith:NSNumber.class];
}

- (TJConvertible<NSArray *> * _Nonnull (^)(NSString * _Nonnull))array {
    return [self makeDictionaryAccessorConvertibleBlockWith:NSArray.class];
}

- (TJConvertible<NSDictionary *> * _Nonnull (^)(NSString * _Nonnull))dictionary {
    return [self makeDictionaryAccessorConvertibleBlockWith:NSDictionary.class];
}

- (TJConvertible<id> * _Nonnull (^)(NSString * _Nonnull))any {
    return [self makeDictionaryAccessorConvertibleBlockWith:nil];
}

#pragma mark - Private

- (TJConvertible * _Nonnull (^)(NSString * _Nonnull))makeDictionaryAccessorConvertibleBlockWith:(Class)cls {
    return ^TJConvertible<id> * (NSString *key) {
        return [TJConvertible<id> create:^id _Nullable {
            NSDictionary *json = self.dictionaryValue;
            if (!json) {
                return nil;
            }
            if (!cls) {
                return json[key];
            } else {
                return json[key] && [json[key] isKindOfClass:cls] ? json[key] : nil;
            }
        }];
    };
}

@end
