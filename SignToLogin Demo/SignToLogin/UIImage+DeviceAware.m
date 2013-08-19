//
//  UIImage+DeviceAware.m
//  SignToLogin
//
//  Created by Pavel Sumarokov on 5/1/13.
//  Copyright (c) 2013 KASIB. All rights reserved.
//

#import "UIImage+DeviceAware.h"

@implementation UIImage (DeviceAware)

+ (UIImage*)imageByName:(NSString*)name
{
    NSString *imageName = [NSString stringWithFormat: @"%@%@",
                           name, [UIImage suffix]];
    return [UIImage imageNamed: imageName];
}

+ (NSString*)suffix
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return @"~ipad.png";
    return @".png";
}

@end
