//
//  Compatible-Tests.m
//  HCBFinancialTools_Tests
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 李茂. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import <TypedJSON/TypedJSON.h>

SPEC_BEGIN(Compatible)

describe(@"Compatible tests", ^{
    context(@"will get convertible instance from", ^{
        it(@"NSDictionary", ^{
            [[@{}.tj shouldNot] beNil];
        });
    });
    
    context(@"will get convertible instance and the value equals to self", ^{
        it(@"NSDictionary", ^{
            [[@{ @"foo": @"bar" }.tj.value should] equal:@{ @"foo": @"bar" }];
        });
    });
});

SPEC_END
