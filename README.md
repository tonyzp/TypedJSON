# TypedJSON

[![CI Status](https://img.shields.io/travis/tp/TypedJSON.svg?style=flat)](https://travis-ci.org/tp/TypedJSON)
[![Version](https://img.shields.io/cocoapods/v/TypedJSON.svg?style=flat)](https://cocoapods.org/pods/TypedJSON)
[![License](https://img.shields.io/cocoapods/l/TypedJSON.svg?style=flat)](https://cocoapods.org/pods/TypedJSON)
[![Platform](https://img.shields.io/cocoapods/p/TypedJSON.svg?style=flat)](https://cocoapods.org/pods/TypedJSON)

## The way we handle Objective-C dictionary is Ugly.

Objective-C is a runtime, weakly typed language. The `NSDictionary` class in Objective-C isn't a type safety object. 

Suppose we have a json dictionary:

```objectivec
NSDictionary *json = @{ @"username": @"tp",
                        @"password": @"123456",
                        @"scores": @{ @"programming": @70, @"language": @80 },
                        @"tels": @[ @"1367890876", @"02884435261" ] };
```

We may access the dictionary in this way:

```objectivec
NSString *username = json[@"username"];

if (!username || ![username isKindOfClass:NSString.class] || username.length == 0) {
    return;
}

// Do something with username string
```

or:

```objectivec
NSDictionary *scores = json[@"scores"];

if (!scores || ![scores isKindOfClass:NSDictionary.class] || scores.count == 0) {
    return;
}

NSNumber *score = scores[@"programming"];

if (!score || ![score isKindOfClass:NSNumber.class]) {
    return;
}

// Do something with programming score number
```

The problem here is, **we do much things with type & value check to insure type safety, these make our code ugly**.

## A better way handle this

With `TypedJSON`, we use chain operators to sole this problem in a semantic way. These try to insure the elegance and readability of the code.

```objectivec
NSString *username = json.tj.string(@"username").without.empty.value;

if (!username) {
    return;
}

// Do something with username string
```

and:

```objectivec
NSNumber *score = json.tj.dictionary(@"scores").number(@"programming").value;

if (!score) {
    return;
}

// Do something with programming score number
```
## Installation

`TypedJSON` is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TypedJSON'
```

Then run `pod install` to integrate.

## Author

tp, pzhang0414@gmail.com

## License

TypedJSON is available under the MIT license. See the LICENSE file for more info.
