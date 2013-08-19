//
//  HistoryViewController.h
//  SignToLoginSDK
//
//  Created by Anna on 7/3/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

@interface HistoryViewController : UIViewController

@property (nonatomic, strong) NSString *apiKey;

-(id)initWithDocumentId:(NSString*)documentId;
-(id)initWithURL:(NSURL*)url;

@end
