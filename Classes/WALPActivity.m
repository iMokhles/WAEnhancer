//
//  WALPActivity.m
//  WallpaperPlus
//
//  Created by iMokhles on 8/25/14.
//  Copyright (c) 2014 iMokhles. All rights reserved.
//

#import "WALPActivity.h"
#include <notify.h>

@interface NSDistributedNotificationCenter : NSNotificationCenter
@end

static NSString *const WALPWallpaperUpdateNotification = @"WALPWallpaperUpdateNotification";

static NSString *const WALPErrorKey = @"error";

@interface WALPActivity (WAEnhancer) <WAWallpaperPreviewControllerDelegate>
@end

@implementation WALPActivity

- (NSString *)activityType
{
    return @"com.imokhles.WallpaperActivity";
}

- (NSString *)activityTitle
{
    return NSLocalizedString(@"Save As Wallpaper", @"Save As Wallpaper");
}

- (UIImage *)activityImage
{
    // Note: These images need to have a transparent background and I recommend these sizes:
    // iPadShare@2x should be 126 px, iPadShare should be 53 px, iPhoneShare@2x should be 100
    // px, and iPhoneShare should be 50 px. I found these sizes to work for what I was making.
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return [UIImage imageWithContentsOfFile:@"/Library/Application Support/WAEnhancer/WALPActivityIpad.png"];
    }
    else
    {
        return [UIImage imageWithContentsOfFile:@"/Library/Application Support/WAEnhancer/WALPActivityiPhone.png"];
    }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    for (UIActivityItemProvider *item in activityItems) {
        if ([item isKindOfClass:[UIImage class]]) {
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id item in activityItems) {
        if ([item isKindOfClass:[UIImage class]]) {
            sharedImage = (UIImage *)item;
        }
    }
}

- (UIViewController *)activityViewController
{
    NSLog(@"%s",__FUNCTION__);
    wallImageController = [[objc_getClass ("WAWallpaperPreviewController") alloc] init];
    // wallImageController = [objc_getClass ("WAWallpaperPreviewController") controllerWithImage:sharedImage];
    [wallImageController setImage:sharedImage];
    [wallImageController setDelegate:self];
    return wallImageController;
}
- (void)wallpaperPreviewControllerDidCancel:(WAWallpaperPreviewController *)arg1 {
    [self activityDidFinish:YES];
}
- (void)wallpaperPreviewController:(WAWallpaperPreviewController *)arg1 didSelectImage:(UIImage *)arg2 {
    NSString *imagePath = [(WhatsAppAppDelegate *)[[UIApplication sharedApplication] delegate] wallpaperImagePath];
    sharedImage = arg2;
    NSData *imageData = UIImagePNGRepresentation(sharedImage);
    [imageData writeToFile:imagePath atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"WallpaperDidChangeNotification" object:nil];
    [self activityDidFinish:YES];
}
/*
- (void)performActivity
{
    // This is where you can do anything you want, and is the whole reason for creating a custom
    // UIActivity
    
    // Obtaining saving path
    //
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    imgPath = [[NSString stringWithFormat:@"%@/Wallpaperplus/Default/",documentsDirectory] stringByAppendingPathComponent:[NSString stringWithFormat:@"WallpaperPlus.png"]];
    
    if (IS_IPHONE) {
        resizedImage = [sharedImage resizedImageByMagick: @"744x1392#"];
    } else if (IS_IPHONE_5) {
        resizedImage = [sharedImage resizedImageByMagick: @"744x1392#"];
    } else if (IS_IPAD) {
        resizedImage = [sharedImage resizedImageByMagick: @"2524x2524#"];
    }
    
    NSData *imageData = UIImagePNGRepresentation(resizedImage);
    [imageData writeToFile:imgPath atomically:YES];
    if ([[NSFileManager defaultManager] fileExistsAtPath:imgPath]) {
        notify_post("com.imokhles.wallpapertweak.Update-Wallpaper");
    }
    [self activityDidFinish:YES];
}*/

#pragma mark - Callbacks
/*
- (void)wallpaperDidUpdate:(NSNotification *)notification {
    CFNotificationCenterPostNotification(
                                         CFNotificationCenterGetDarwinNotifyCenter(),
                                         CFSTR("com.imokhles.wallpapertweak/ForceUpdate"),
                                         NULL,
                                         NULL,
                                         true
                                         );
}*/
@end