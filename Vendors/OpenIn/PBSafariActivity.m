//
//  PBSafariActivity.m
//  Pinbrowser
//
//  Created by Mikael Konutgan on 12/02/2013.
//  Copyright (c) 2013 Mikael Konutgan. All rights reserved.
//

#import "PBSafariActivity.h"
#import "BrowseInAppViewController.h"

@interface PBSafariActivity ()

@property (strong, nonatomic) NSURL *URL;

@end

@implementation PBSafariActivity

- (NSString *)activityType
{
    return NSStringFromClass([self class]);
}

- (NSString *)activityTitle
{
    return @"Open in Safari";
}

- (UIImage *)activityImage
{
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        // do stuff for iOS 7 and newer
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            NSString *imagePath = @"/Library/Application Support/WAEnhancer/ARSafariActivity-iPad.png";
            return [UIImage imageWithContentsOfFile:imagePath];
        } else {
            
            NSString *imagePath = @"/Library/Application Support/WAEnhancer/ARSafariActivity.png";
            return [UIImage imageWithContentsOfFile:imagePath];
        }
        
    } else {
        // do stuff for older versions than iOS 7
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            NSString *imagePath = @"/Library/Application Support/WAEnhancer/Safari@2x~iPad.png";
            return [UIImage imageWithContentsOfFile:imagePath];
        } else {
            
            NSString *imagePath = @"/Library/Application Support/WAEnhancer/Safari.png";
            return [UIImage imageWithContentsOfFile:imagePath];
        }
    }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[NSURL class]] && [[UIApplication sharedApplication] canOpenURL:activityItem]) {
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[NSURL class]]) {
            self.URL = activityItem;
            return;
        }
    }
}

- (void)performActivity
{
    [[UIApplication sharedApplication] openURL:self.URL];
    [BrowseInAppViewController dismiss];
    [self activityDidFinish:YES];
}

@end
