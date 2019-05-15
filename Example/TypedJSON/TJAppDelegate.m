//
//  TJAppDelegate.m
//  TypedJSON
//
//  Created by tp on 05/14/2019.
//  Copyright (c) 2019 tp. All rights reserved.
//

#import "TJAppDelegate.h"

#import <TypedJSON/TypedJSON.h>

@interface TJAppDelegate ()

- (NSDictionary *)loanJSON;

@end

@implementation TJAppDelegate

#pragma mark - Private (UIApplicationDelegate)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSDictionary *json = [self loanJSON];
    
    // Get username from json exclued empty string value '', return 'anonymous' while nil.
    NSString *username = json.tj.string(@"username").without.empty.defaults(@"anonymous").value;
    
    // Get programming score number in scores dictionary from json.
    NSNumber *programmingScore = json.tj.dictionary(@"scores").number(@"programming").value;
    
    // Get politics score number in scores dictionary from json, return 0 while politics do not exists.
    NSNumber *politicsScore = json.tj.dictionary(@"scores").number(@"politics").with.defaults(@0).value;
    
    NSLog(@"The programming score of %@ is %@, and politics %@.", username, programmingScore, politicsScore);
    
    return YES;
}

#pragma mark - Private (Others)

- (NSDictionary *)loanJSON {
    NSString *file = [NSBundle.mainBundle pathForAuxiliaryExecutable:@"test.json"];
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return json;
}

@end
