//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class ImageSearchController, NSURL;

@protocol ImageSearchControllerDelegate <NSObject>
- (void)imageSearchControllerDidCancel:(ImageSearchController *)arg1;
- (void)imageSearchController:(ImageSearchController *)arg1 didSelectImageWithURL:(NSURL *)arg2;
@end

