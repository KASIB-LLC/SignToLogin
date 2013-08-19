//
//  UserSettings.h
//  SignToLoginSDK
//
//  Created by Pavel Sumarokov on 7/5/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

@interface UserSettings : NSObject

+ (UserSettings*)instance;

- (BOOL) isLoggedIn;
- (void) logout;
- (NSString*) email;

@end
