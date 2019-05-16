//
//  NSDictionary+Compatible-Tests.m
//  HCBFinancialToolsTests
//
//  Created by 李茂 on 05/08/2019.
//  Copyright (c) 2019 李茂. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

#import <Kiwi/Kiwi.h>

#import <TypedJSON/TypedJSON.h>

SPEC_BEGIN(NSDictionary_Compatible)

describe(@"NSDictionary compatible tests", ^{
    __block NSDictionary *json;

    beforeAll(^{
        json = @{@"name": @"test",
                 @"password": @"123",
                 @"age": @40,
                 @"scores": @[@100, @60, @78],
                 @"channles": @{},
                 @"info": @{@"user": @{@"id": @1000}}};
    });

    context(@"will read json", ^{
        it(@"can read string", ^{
            [[json.tj.string(@"name").value should] equal:@"test"];
            [[json.tj.string(@"password").value should] equal:@"123"];
        });

        it(@"can read number", ^{
            [[json.tj.number(@"age").value should] equal:@40];
        });

        it(@"can read array", ^{
            [[json.tj.array(@"scores").value should] equal:@[@100, @60, @78]];
        });

        it(@"can read dictionary", ^{
            [[json.tj.dictionary(@"channles").value shouldNot] beNil];
        });
        
        it(@"can read any thing", ^{
            [[json.tj.any(@"name").value shouldNot] beNil];
            [[json.tj.any(@"password").value shouldNot] beNil];
            [[json.tj.any(@"age").value shouldNot] beNil];
            [[json.tj.any(@"scores").value shouldNot] beNil];
            [[json.tj.any(@"channles").value shouldNot] beNil];
            [[json.tj.any(@"info").value shouldNot] beNil];
        });
    });

    context(@"will read json with correct type", ^{
        it(@"can not read string as number", ^{
            [[json.tj.number(@"name").value should] beNil];
        });

        it(@"can not read dictionary as array", ^{
            [[json.tj.array(@"channles").value should] beNil];
        });
    });

    context(@"will read json with sematic", ^{
        it(@"has with sematic", ^{
            [[json.tj.string(@"name").with.empty.value should] beNil];
            [[json.tj.string(@"password").with.empty.value should] beNil];
            [[json.tj.number(@"age").with.empty.value shouldNot] beNil];
            [[json.tj.array(@"scores").with.empty.value should] beNil];
            [[json.tj.dictionary(@"channles").with.empty.value shouldNot] beNil];
        });

        it(@"has without sematic", ^{
            [[json.tj.string(@"name").without.empty.value shouldNot] beNil];
            [[json.tj.string(@"password").without.empty.value shouldNot] beNil];
            [[json.tj.number(@"age").with.empty.value shouldNot] beNil];
            [[json.tj.array(@"scores").without.empty.value shouldNot] beNil];
            [[json.tj.dictionary(@"channles").without.empty.value should] beNil];
        });

        it(@"in chain", ^{
            [[json.tj.dictionary(@"info").dictionary(@"user").number(@"id").without.empty.value should] equal:@1000];
            [[json.tj.dictionary(@"info").string(@"user").value should] beNil];
            [[json.tj.dictionary(@"name").dictionary(@"user").value should] beNil];
        });
    });
    
    context(@"will work with operators", ^{
        it(@"can find object recursively", ^{
            [[json.tj.find(@"name").value should] equal:@"test"];
            [[json.tj.find(@"id").value should] equal:@1000];
        });
        
        it(@"can provider default value", ^{
            [[json.tj.string(@"username").with.defaults(@"haha").value shouldNot] beNil];
            [[json.tj.string(@"username").without.empty.defaults(@"haha").value shouldNot] beNil];
            [[json.tj.string(@"username").with.defaults(@"haha").without.empty.value shouldNot] beNil];
            [[json.tj.dictionary(@"channles").without.empty.with.defaults(@{}).value shouldNot] beNil];
        });
        
        it(@"can make sure the value matches specified type", ^{
            [[json.tj.any(@"name").as(NSString.class).value should] equal:@"test"];
        });
    });
    
    context(@"will work with valuable extensions", ^{
        it(@"can make sure value is string", ^{
            [[json.tj.find(@"name").stringValue should] equal:@"test"];
        });
        
        it(@"can make sure value is number", ^{
            [[json.tj.find(@"id").numberValue should] equal:@1000];
        });
        
        it(@"can make sure value is array", ^{
            [[json.tj.find(@"scores").arrayValue shouldNot] beNil];
        });
        
        it(@"can make sure value is dictionary", ^{
            [[json.tj.find(@"channles").dictionaryValue shouldNot] beNil];
        });
    });
});

SPEC_END
