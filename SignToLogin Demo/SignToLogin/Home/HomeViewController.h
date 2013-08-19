//
//  HomeViewController.h
//  SignToLogin
//
//  Created by Pavel Sumarokov on 5/1/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

#import "HomeActionsDelegate.h"

@interface HomeViewController : UIViewController<HomeActionsDelegate>


//Handling external commands
-(void)openURL:(NSURL*)url;
-(void)openPDF:(NSString*)pdfName;
-(void)showAlertAbout:(NSString*)message;

@end
