//
//  MLCruxActivity.m
//  MLCruxActivityDemo
//
//  Created by Maximilian Litteral on 3/6/13.
//  Copyright (c) 2013 Maximilian Litteral. All rights reserved.
//

#import "MLCruxActivity.h"
#import "BrowseInAppViewController.h"

@implementation MLCruxActivity
{
    NSString *urlString;
}
#pragma mark - Activity Info

- (UIImage*)activityImage {
    NSString *imagePath = @"/Library/Application Support/WAEnhancer/MLCruxActivity.png";
    return [UIImage imageWithContentsOfFile:imagePath];
}

- (NSString*)activityTitle {
    NSString *localizePath = @"/Library/Application Support/WAEnhancer/BrowseInSide.bundle";
	return NSLocalizedStringFromTableInBundle(@"Open in Crux", NSStringFromClass([self class]), [NSBundle bundleWithPath:localizePath], nil);
}

- (NSString*)activityType {
    return @"UIActivityTypeOpenIn";
}

#pragma mark - Activity Actions

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    if (activityItems == nil) return NO;
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"crux://"]]) return NO;
    for (id object in activityItems) {
        if ([[object class] isSubclassOfClass:[NSURL class]]) return YES;
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id object in activityItems) {
        if ([[object class] isSubclassOfClass:[NSURL class]]) {
            urlString = [NSString stringWithFormat:@"crux://newTab?url=%@",object];
            return;
        }
    }
}

- (void)performActivity {
    NSLog(@"opening url in Crux with string: %@",urlString);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    [BrowseInAppViewController dismiss];
    [self activityDidFinish:YES];
}
@end
