//
//  TJCompatible.h
//  TypedJSON
//
//  Created by tp on 2019/5/8.
//  Copyright © 2019 tp. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TJConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TJCompatible <NSObject>

- (TJConvertible *)tj;

@end

NS_ASSUME_NONNULL_END
