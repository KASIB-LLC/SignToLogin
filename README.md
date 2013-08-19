# SignToLogin

SignToLogin SDK provides API for signature verification and secure exchange of PDF documents.

Learn more about [SignToLogin Cloud Signature Verification Platform](https://signtologin.com/)

## Registering your own application

Obtaining *API Key*:

* Open SignToLogin [Registration Form](https://signtologin.com/registration) in web browser
* Enter your e-mail, name and verification code
* Check mail box and open e-mail confirmation link to activate an account
* Follow instructions to create your signature sample
* Finish registration
* Open Applications section in your Profile
* Add an application
* The system will generate 32 characters long API key

## Requirements

SDK requires only standard iOS frameworks to be included:

* CoreLocation.framework
* MessageUI.framework
* ImageIO.framework
* MobileCoreServices.framework
* SystemConfiguration.framework
* QuartzCore.framework
* UIKit.framework
* Foundation.framework
* CoreGraphics.framework

Select your project in Navigator and add them as shown below:

[![](https://signtologin.com/media/docs/required_frameworks.png)](https://signtologin.com/media/docs/required_frameworks.png)

## Adding SignToLogin SDK to your project

[Download SDK](https://signtologin.com/media/docs/SignToLoginSDK.zip) to get started. Unzip the file and copy its content to your project in XCode:

[![](https://signtologin.com/media/docs/including_sdk.png)](https://signtologin.com/media/docs/including_sdk.png)

Explicitly add "$(SRCROOT)/SignToLoginSDK/" to "Library Search Paths" so XCode knows where to look for static libraries:

[![](https://signtologin.com/media/docs/library_search_path.png)](https://signtologin.com/media/docs/library_search_path.png)

Similarly add -ObjC to "Other Linker Flags". Otherwise linker won't know about some symbols from categories and library will crash at runtime.

## Integrating SignToLogin Registration and Login controllers into your app

Registration and Login controllers can be displayed on both iPhone and iPad devices from your own UIViewController subclass using either navigation stack or presentModalViewController:

    :::objective-c
    NSString *API_KEY = @"5856************************38bb";
    ...
    LoginViewController *loginController = [[LoginViewController alloc]
                                            initWithDelegate: self];
    loginController.apiKey = API_KEY;
    [self.navigationController pushViewController: loginController animated: YES];

Your controller should also implement RegistrationDelegate or AuthorizationDelegate protocol respectively:

    :::objective-c
    - (void) passedAuthorization {
        // Gives user access to a content
    }

    - (void) cancelledAuthorization {
        [self.navigationController popViewControllerAnimated: YES];
    }

## Displaying list of PDF documents

It's easy to display all PDFs stored in Documents directory using DocumentsViewController:

    :::objective-c
    DocumentsViewController *docs = [DocumentsViewController new];
    docs.apiKey = API_KEY;
    [self.navigationController pushViewController:docs animated:YES];

User would be able to open editor and sign any document from the list:

[![](https://signtologin.com/media/docs/signing_pdf.png)](https://signtologin.com/media/docs/signing_pdf.png)

DocumentsViewController provides openPDFControllerWithDocument method to open any document in editor programmatically.

## Providing sample PDF documents from application Bundle

PreBundledPDFLoader allows to copy PDFs from specified directory within application Bundle to standard iOS Documents directory. Another key feature of this class is *loadFileFromURL*. It makes a copy of external PDF file opened by your app via *application:handleOpenURL:* method.

## Browsing document history

Any document can be signed several times. All these attempts are visible via HistoryViewController:

    :::objective-c
    HistoryViewController *history = [[HistoryViewController alloc] initWithURL:url];
    history.apiKey = API_KEY;
    [self.navigationController pushViewController: history animated: YES];

## Odds and ends

Edit "Document types" supported by your app in YourApp-Info.plist to be able to open external PDFs using application:handleOpenURL: method in AppDelegate.

UserSettings tracks login / logout actions and memorizes current status in NSUserDefaults. Use it for convenience.

Review Demo Application for further reference.

Please don't hesitate to contact ntc.kasib@gmail.com if you have any questions or suggestions regarding SDK.
