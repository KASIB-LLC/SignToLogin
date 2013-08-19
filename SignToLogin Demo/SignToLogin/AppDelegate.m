//
//  AppDelegate.m
//  SignToLogin
//
//  Created by Pavel Sumarokov on 5/1/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "PreBundledPDFLoader.h"

@implementation AppDelegate
{
    HomeViewController *homeController;
    PreBundledPDFLoader *pdfLoader;
}

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    [self addHomeController];
    [self.window makeKeyAndVisible];
    [self loadInidialPdfs];
    return YES;
}

- (void) loadInidialPdfs
{
    pdfLoader = [PreBundledPDFLoader new];
    [pdfLoader loadDocumentsFromBundleDirectory: @"myPDFDocs/"];
}

- (void) addHomeController
{
    homeController = [HomeViewController new];
    UINavigationController *navigationController =
        [[UINavigationController alloc] initWithRootViewController: homeController];
    self.window.rootViewController = navigationController;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if (!url)
        return NO;

    if([pdfLoader isPDF: [url relativeString]])
    {
        [self openPdfFromUrl: url];
        return YES;
    }

    if([[url relativeString] hasPrefix:@"stl://"])
    {
        [homeController openURL:url];
        return YES;
    }

    return NO;
}

- (void) openPdfFromUrl:(NSURL*)url
{
    NSError *error = nil;
    NSString *fileName = [pdfLoader loadFileFromURL:url error:&error];

    if(fileName != nil)
        [homeController openPDF: fileName];
    else
        [homeController showAlertAbout:error.localizedDescription];    
}

@end
