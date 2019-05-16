//
//  TJConvertible+Semantic.m
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 tp. All rights reserved.
//

#import "TJConvertible+Semantic.h"

#import <objc/runtime.h>

@implementation TJConvertible (Semantic)

#pragma mark - Public (Setter)

- (void)setNegation:(BOOL)negation {
    if (self.negation != negation) {
        objc_setAssociatedObject(self, @selector(negation), @(negation), OBJC_ASSOCIATION_RETAIN);
    }
}

#pragma mark - Public (Getter)

- (BOOL)negation {
    return [objc_getAssociatedObject(self, @selector(negation)) boolValue];
}

#pragma mark - Public (Other)

- (TJConvertible<id> *)with {
    return self;
}

- (TJConvertible<id> *)without {
    TJConvertible<id> *convertible = [TJConvertible<id> create:self.maker];
    convertible.negation = !self.negation;
    return convertible;
}

@end
