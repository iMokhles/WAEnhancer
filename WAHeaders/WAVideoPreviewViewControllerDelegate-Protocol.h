//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSError, WAVideoPreviewViewController;

@protocol WAVideoPreviewViewControllerDelegate <NSObject>
- (void)videoPreviewViewControllerDidCancel:(WAVideoPreviewViewController *)arg1;
- (void)videoPreviewViewController:(WAVideoPreviewViewController *)arg1 didFailWithError:(NSError *)arg2;
- (void)videoPreviewViewControllerDidConfirmVideo:(WAVideoPreviewViewController *)arg1;
@end
