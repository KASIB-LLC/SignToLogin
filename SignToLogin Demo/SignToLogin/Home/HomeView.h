//
//  HomeView.h
//  SignToLogin
//
//  Created by Pavel Sumarokov on 5/1/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

#import "HomeActionsDelegate.h"

@interface HomeView : UIView

- (id)initWithFrame:(CGRect)frame
        andDelegate:(id<HomeActionsDelegate>)_delegate;

@end
