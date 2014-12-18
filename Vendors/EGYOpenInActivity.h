//
//  EGYOpenInActivity.h
// 	EGYOpenInActivity
//
//  Copyright (c) 2013 iOSDevT. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@class EGYOpenInActivity;

@protocol EGYOpenInActivityDelegate <NSObject>
@optional
- (void)openInAppActivityWillPresentDocumentInteractionController:(EGYOpenInActivity*)activity;
- (void)openInAppActivityDidDismissDocumentInteractionController:(EGYOpenInActivity*)activity;
@end

@interface EGYOpenInActivity : UIActivity <UIDocumentInteractionControllerDelegate>

@property (nonatomic, weak) id superViewController;
@property (nonatomic, weak) id<EGYOpenInActivityDelegate> delegate;

- (id)initWithView:(UIView *)view andRect:(CGRect)rect;
- (id)initWithView:(UIView *)view andBarButtonItem:(UIBarButtonItem *)barButtonItem;

- (void)dismissDocumentInteractionControllerAnimated:(BOOL)animated;

@end

