//
//  TJDefine.h
//  TypedJSON
//
//  Created by tp on 2019/8/26.
//

#ifndef TJDefine_h
#define TJDefine_h

/// Macro for accessing tj with nullability & type check
#define TJ(json) (json && [json isKindOfClass:NSDictionary.class] ? json : @{}).tj

#endif /* TJDefine_h */
