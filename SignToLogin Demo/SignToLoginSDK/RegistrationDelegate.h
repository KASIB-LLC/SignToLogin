//
//  RegistrationDelegate.h
//  SignToLoginSDK
//
//  Created by Pavel Sumarokov on 7/2/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

@protocol RegistrationDelegate<NSObject>

- (void) passedRegistration;
- (void) cancelledRegistration;

@end
