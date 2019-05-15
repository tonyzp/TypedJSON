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

## More example

The json data in this example:

```json
{
	"username": "tp",
	"password": "123456",
	"scores": {
		"programming": 70,
		"language": 80
	},
	"tels": [
		"+8613612345678",
		"028-84555555"
	]
}
```

How we access this json dictionary with `TypedJSON`:

```objective-c
NSDictionary *json = [self loadJSON];
    
// Get username from json exclued empty string value '', return 'anonymous' while nil.
NSString *username = json.tj.string(@"username").without.empty.defaults(@"anonymous").value;
    
// Get programming score number in scores dictionary from json.
NSNumber *programmingScore = json.tj.dictionary(@"scores").number(@"programming").value;
    
// Get politics score number in scores dictionary from json, return 0 while politics do not exists.
NSNumber *politicsScore = json.tj.dictionary(@"scores").number(@"politics").with.defaults(@0).value;
    
NSLog(@"The programming score of %@ is %@, and politics %@.", username, programmingScore, politicsScore);
```

## Installation

`TypedJSON` is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TypedJSON'
```

Then run `pod install` to integrate.

## Usage

To import `TypedJSON`, you just:

```objectivec
#import <TypedJSON/TypedJSON.h>
```

### Read value in dictionary with type safety

Read string in dictionary with a specified key:

```objectivec
json.tj.string(@"foo").value;
```

> The value could be nil while it's not a `NSString` type.

Read number in dictionary with a specified key:

```objectivec
json.tj.number(@"foo").value;
```

> The value could be `nil` while it's not a `NSNumber` type.

Read array in dictionary with a specified key:

```objectivec
json.tj.array(@"foo").value;
```

> The value could be `nil` while it's not a `NSArray` type.

Read dictionary in dictionary with a specified key:

```objectivec
json.tj.dictionary(@"foo").value;
```
> The value could be `nil` while it's not a `NSDictionary` type.

### Insure not empty

Sometimes we get empty value in ditionary, such as:

- empty string: `""`
- empty array: `@[]`
- empty dictionary: `@{}`

Use `- empty` operator to ignore them:

```objectivec
json.tj.string(@"foo").without.empty.value;
```

> Return `nil` if the value of `"foo"` is a `""`

```objectivec
json.tj.array(@"foo").without.empty.value;
```

> Return `nil` if the value of `"foo"` is a `@[]`

```objectivec
json.tj.dictionary(@"foo").without.empty.value;
```

> Return `nil` if the value of `"foo"` is a `@{}`

### Provide default value while get `nil`

Suppose we get `nil` value in the chain, and we need to provide a default value:

```objectivec
json.tj.string(@"foo").with.defaults(@"bar").value;
```

> The `- with` operator could be omitted, it just to insure semantics of the statment.

### The `- any` operator

This operator just get value by a specified key, without type check:

```objectivec
json.tj.any(@"foo").value;
```

> The return value id an `id` type.

Or you could use `Valuable` extension to do the type check:

```objectivec
json.tj.any(@"foo").stringValue;
```

> `- stringValue` will make sure the return value matches `NSString` type, if not then return `nil`.

### Access values in a chain

Supporse the value is wrapped in the inner dictionary:

```json
{
	"foo": {
		"bar": {
			"greeting": "Hello ~"
		}
	}
}
```

We can access the `greeting` in a chain:

```objectivec
json.tj.dictionary(@"foo").dictionary(@"bar").string(@"greeting").value;
```

### The `- find` operator

In the example above we access `greeting` in an operator chain, with `- find` operator we can change the code:

```objectivec
json.tj.find(@"greeting").value;
```

`- find` operator enumerate the dictionary recursively to get the value mathes the specified key, but doen't do the type check. Inorder to insure type safety of return value, we could use `Valuable` method `- stringValue`:

```objectivec
json.tj.find(@"greeting").stringValue;
```

## Author

tp, pzhang0414@gmail.com

## License

TypedJSON is available under the MIT license. See the LICENSE file for more info.
