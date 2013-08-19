//
//  HomeView.m
//  SignToLogin
//
//  Created by Pavel Sumarokov on 5/1/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

#import "HomeView.h"
#import "UIImage+DeviceAware.h"

@interface HomeView()
{
    UILabel *headerLabel;
    UIImageView *signImageView;
    UILabel *aboutLabel;
    UIButton *registerButton;
    UIButton *loginButton;
    UIButton *pdfButton;

    id<HomeActionsDelegate> delegate;
}

@end

const CGFloat kSections = 16;

@implementation HomeView

- (id)initWithFrame:(CGRect)frame andDelegate:(id<HomeActionsDelegate>)_delegate
{
    if (self = [super initWithFrame: frame])
    {
        delegate = _delegate;
        self.backgroundColor = [UIColor whiteColor];
        [self configureView];
    }
    return self;
}

- (void)configureView
{
    [self addHeader];
    [self addSignImage];
    [self addAboutText];
    [self addLoginButton];
    [self addRegisterButton];
//    [self addPDFButton];
}

- (void)addHeader
{
    headerLabel = [UILabel new];
    headerLabel.font = [self headerFont];
    headerLabel.text = NSLocalizedString(@"home_header", nil);
    CGSize size = [headerLabel.text sizeWithFont: headerLabel.font];
    headerLabel.frame = CGRectMake(0.0, 0.0, size.width, size.height);
    headerLabel.textColor = [UIColor blueColor];
    [self addSubview: headerLabel];
}

- (void)addSignImage
{
    UIImage *signImage = [UIImage imageByName: @"signDocument"];
    signImageView = [[UIImageView alloc] initWithImage: signImage];
    [self addSubview: signImageView];
}

- (void)addAboutText
{
    aboutLabel = [UILabel new];
    aboutLabel.font = [self textFont];
    aboutLabel.text = NSLocalizedString(@"home_about", nil);
    aboutLabel.numberOfLines = 6;
    aboutLabel.textAlignment = UITextAlignmentCenter;
    [self addSubview: aboutLabel];
}

- (void)addLoginButton
{
    loginButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    loginButton.frame = CGRectMake(0.0, 0.0, 200.0, 40.0);
    [loginButton setTitle: NSLocalizedString(@"home_signin", nil)
                  forState: UIControlStateNormal];
    [loginButton addTarget: delegate action: @selector(onLogin)
           forControlEvents: UIControlEventTouchUpInside];
    [self addSubview: loginButton];
}

- (void)addRegisterButton
{
    registerButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    registerButton.frame = CGRectMake(0.0, 0.0, 200.0, 40.0);
    [registerButton setTitle: NSLocalizedString(@"home_register", nil)
                    forState: UIControlStateNormal];
    [registerButton addTarget: delegate action: @selector(onRegister)
             forControlEvents: UIControlEventTouchUpInside];
    [self addSubview: registerButton];
}

- (void)addPDFButton
{
    pdfButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    pdfButton.frame = CGRectMake(0.0, 0.0, 200.0, 40.0);
    [pdfButton setTitle: @"PDF" forState: UIControlStateNormal];
    [pdfButton addTarget: delegate action: @selector(onPDF)
             forControlEvents: UIControlEventTouchUpInside];
    [self addSubview: pdfButton];
}
- (void)layoutSubviews
{
    headerLabel.center = [self pointInSection: 1];
    signImageView.center = [self pointInSection: 4];
    CGSize size = [self aboutLabelSize];
    aboutLabel.frame = CGRectMake(0.0, 0.0, size.width, size.height);
    aboutLabel.center = [self pointInSection: 8];
    loginButton.center = [self pointInSection: 11];
    registerButton.center = [self pointInSection: 14];
}

- (CGSize)aboutLabelSize
{
    CGSize constraintSize = CGSizeMake(self.bounds.size.width * 0.94,
                                       self.bounds.size.height);
    return [aboutLabel.text sizeWithFont: aboutLabel.font
                       constrainedToSize: constraintSize];
}

// Screen is devided into k vertical sections for aligning UI elements
- (CGPoint) pointInSection:(NSInteger)section
{
    return CGPointMake(self.bounds.size.width / 2,
                       self.bounds.size.height * section / kSections);
}

- (UIFont*)headerFont
{
    CGFloat scale = 1.0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        scale = 1.5;
    return [UIFont fontWithName: @"Helvetica" size: 16.0 * scale];
}

- (UIFont*)textFont
{
    CGFloat scale = 1.0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        scale = 1.5;
    return [UIFont fontWithName: @"Helvetica" size: 13.0 * scale];
}

@end
