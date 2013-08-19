//
//  DocumentsViewController.h
//  SignToLogin
//
//  Created by Anna on 6/3/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

@interface DocumentsViewController : UIViewController

@property (nonatomic, strong) NSString *apiKey;

- (void) openPDFControllerWithDocument:(NSString*)documentName animated:(BOOL)animated;

@end
