//
//  Check-Tests.m
//  TypedJSON-Unit-Tests
//
//  Created by tp on 2019/8/26.
//

#import <Kiwi/Kiwi.h>

#import <TypedJSON/TypedJSON.h>

SPEC_BEGIN(Check)

describe(@"Access with nullability & type check", ^{
    context(@"while json is nil", ^{
        NSDictionary *json = nil;
        it(@"should not crash", ^{
            [[TJ(json).string(@"username").without.empty.value should] beNil];
        });
    });
    
    context(@"while json is not a dictionary class", ^{
        NSDictionary *json = (NSDictionary *)@[@"haha"];
        it(@"shoult return empty value", ^{
            [[TJ(json).string(@"username").without.empty.value should] beNil];
        });
    });
});

SPEC_END
