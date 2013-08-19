//
//  RegisterViewController.h
//  SignToLogin
//
//  Created by Evgeniy Gushchin on 5/6/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

#import "RegistrationDelegate.h"

@interface RegisterViewController : UIViewController

- (id) initWithDelegate:(id<RegistrationDelegate>)delegate;

@property (nonatomic, strong) NSString *apiKey;

@end
