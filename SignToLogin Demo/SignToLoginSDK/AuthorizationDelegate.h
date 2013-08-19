//
//  AuthorizationDelegate.h
//  SignToLoginSDK
//
//  Created by Pavel Sumarokov on 7/2/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

@protocol AuthorizationDelegate <NSObject>

- (void) passedAuthorization;
- (void) cancelledAuthorization;

@end
