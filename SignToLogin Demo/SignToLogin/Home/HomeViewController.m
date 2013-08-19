//
//  HomeViewController.m
//  SignToLogin
//
//  Created by Pavel Sumarokov on 5/1/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "DocumentsViewController.h"
#import "RegistrationDelegate.h"
#import "AuthorizationDelegate.h"
#import "UserSettings.h"
#import "HistoryViewController.h"

NSString *API_KEY = @"58560dee5cdebb7298cd0bf9d98138bb";

@interface HomeViewController()<RegistrationDelegate, AuthorizationDelegate>

@end

@implementation HomeViewController
{
    DocumentsViewController *docs;
}
- (void)loadView
{
    CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    self.view = [[HomeView alloc] initWithFrame: appFrame andDelegate: self];
    self.title = NSLocalizedString(@"home_title", nil);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    self.navigationItem.title = NSLocalizedString(@"back", nil);;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    self.navigationItem.title = NSLocalizedString(@"home_title", nil);
    if ([[UserSettings instance] isLoggedIn])
        [self onPDF];
}

#pragma mark - HomeActionsDelegate

- (void)onRegister
{
    RegisterViewController *registerController = [[RegisterViewController alloc]
                                                  initWithDelegate: self];
    registerController.apiKey = API_KEY;
    [self.navigationController pushViewController: registerController
                                         animated: YES];
}

- (void)onLogin
{
    LoginViewController *loginController = [[LoginViewController alloc]
                                            initWithDelegate: self];
    loginController.apiKey = API_KEY;
    [self.navigationController pushViewController: loginController
                                         animated: YES];
}

- (void)onPDF
{
    docs = [DocumentsViewController new];
    docs.apiKey = API_KEY;
    [self.navigationController pushViewController:docs animated:YES];
}

#pragma mark - RegistrationDelegate

- (void) passedRegistration
{
    [self goToPDF];
}

- (void) cancelledRegistration
{
    [self.navigationController popViewControllerAnimated: YES];
}

#pragma mark - AuthorizationDelegate

- (void) passedAuthorization
{
    [self goToPDF];
}

- (void) cancelledAuthorization
{
    [self.navigationController popViewControllerAnimated: YES];
}

- (void) goToPDF
{
    [self.navigationController popToRootViewControllerAnimated: NO];
    [self onPDF];
}

#pragma mark - UIViewControllerRotation

- (BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)orientation
{
    return YES;
}

#pragma mark - Handling external commands

-(void)openURL:(NSURL*)url{
    if ([[UserSettings instance] isLoggedIn]){
        HistoryViewController *history = [[HistoryViewController alloc] initWithURL:url];
        history.apiKey = API_KEY;
        [self.navigationController pushViewController: history animated: YES];
    }else{
        [self.navigationController popToRootViewControllerAnimated: YES];
        NSString * message = NSLocalizedString(@"login_before_history_warning", nil);
        [self showAlertAbout:message];
    }
}

-(void)showAlertAbout:(NSString*)message{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"warning", nil)
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:NSLocalizedString(@"ok", nil)
                                           otherButtonTitles:nil];
    [alert show];
}

-(void)openPDF:(NSString*)pdfName{
    if ([[UserSettings instance] isLoggedIn]){
        [docs openPDFControllerWithDocument:pdfName animated:YES];
    }else{
        [self.navigationController popToRootViewControllerAnimated: YES];
        NSString * message = NSLocalizedString(@"login_before_viewing_warning", nil);
        [self showAlertAbout:message];
    }
}

@end
