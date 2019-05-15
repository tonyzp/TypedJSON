//
//  TJConvertible+Empty.m
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 tp. All rights reserved.
//

#import "TJConvertible+Empty.h"
#import "TJConvertible+Semantic.h"

@implementation TJConvertible (Empty)

#pragma mark - Public

- (TJConvertible *)empty {
    return [TJConvertible create:^id _Nullable {
        id value = self.value;
        // If nil value, then return nil
        if (!value) {
            return nil;
        }
        // If value not respond to - length and - count selector, then return it self
        if (![value respondsToSelector:@selector(length)] &&
            ![value respondsToSelector:@selector(count)]) {
            return value;
        }
        // Check empty
        BOOL empty = NO;
        if ([value respondsToSelector:@selector(length)]) {
            empty = [value length] == 0;
        } else if ([value respondsToSelector:@selector(count)]) {
            empty = [value count] == 0;
        }
        // Handle semantic
        if (self.negation) {
            return empty ? nil : value;
        } else {
            return empty ? value : nil;
        }
    }];
}

@end
