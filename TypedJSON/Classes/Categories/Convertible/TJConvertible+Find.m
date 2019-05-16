//
//  TJConvertible+Find.m
//  TypedJSON
//
//  Created by tp on 2019/5/15.
//

#import "TJConvertible+Find.h"
#import "TJConvertible+Valuable.h"
#import "TJConvertible+NSDictionary.h"
#import "NSDictionary+TJCompatible.h"

@implementation TJConvertible (Find)

#pragma mark - Public

- (TJConvertible<id> * _Nonnull (^)(NSString * _Nonnull))find {
    return ^TJConvertible<id> * (NSString *key) {
        return [TJConvertible<id> create:^id _Nullable {
            NSDictionary *json = self.dictionaryValue;
            // If value is not a json dictionary, then return nil
            if (!json) {
                return nil;
            }
            // If value exists with the specified key, then return value
            if (json[key]) {
                return json[key];
            }
            // Otherwise enumerate and find sub json dictionary to call find resursively.
            for (NSString *k in json) {
                NSDictionary *j = json.tj.dictionary(k).value;
                if (!j) {
                    continue;
                }
                // Check if find the value
                id v = j.tj.find(key).value;
                if (v) {
                    return v;
                }
            }
            // None value could be found, then return nil
            return nil;
        }];
    };
}

@end
