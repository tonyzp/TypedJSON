//
//  TJConvertible+Valuable.m
//  TypedJSON
//
//  Created by tp on 2019/5/15.
//

#import "TJConvertible+Valuable.h"

@implementation TJConvertible (Valuable)

#pragma mark - Public

- (NSString *)stringValue {
    return [self valueWith:NSString.class];
}

- (NSNumber *)numberValue {
    return [self valueWith:NSNumber.class];
}

- (NSArray *)arrayValue {
    return [self valueWith:NSArray.class];
}

- (NSDictionary *)dictionaryValue {
    return [self valueWith:NSDictionary.class];
}

#pragma mark - Private

- (id)valueWith:(Class)cls {
    id value = self.value;
    return value && [value isKindOfClass:cls] ? value : nil;
}

@end
