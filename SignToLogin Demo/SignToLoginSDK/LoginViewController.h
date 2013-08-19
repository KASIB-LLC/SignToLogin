//
//  LoginViewController.h
//  SignToLogin
//
//  Created by Pavel Sumarokov on 5/2/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

#import "AuthorizationDelegate.h"

@interface LoginViewController : UIViewController

- (id) initWithDelegate:(id<AuthorizationDelegate>)delegate;

@property (nonatomic, strong) NSString *apiKey;

@end
