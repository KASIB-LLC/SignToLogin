//
//  PreBundledPDFLoader.h
//  SignToLogin
//
//  Created by Anna on 6/11/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

extern NSString * const PDFLoader_File_Extension;

@interface PreBundledPDFLoader : NSObject

// Loads PDF documents pre-defined inside of the app bundle
-(void) loadDocumentsFromBundleDirectory:(NSString*)directory;

// Returns new file name if loaded successfully
-(NSString*) loadFileFromURL:(NSURL*)url error:(NSError**)error_p;

// Checks file extension
-(BOOL) isPDF:(NSString*)filePath;

@end
