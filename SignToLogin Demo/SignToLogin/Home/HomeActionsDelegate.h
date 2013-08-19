//
//  HomeActionsDelegate.h
//  SignToLogin
//
//  Created by Pavel Sumarokov on 5/1/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

@protocol HomeActionsDelegate <NSObject>

- (void)onRegister;
- (void)onLogin;
- (void)onPDF;

@end
