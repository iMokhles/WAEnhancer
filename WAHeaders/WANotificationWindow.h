//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIWindow.h"

@class NSMutableArray, NSString, UITapGestureRecognizer, UIView;

__attribute__((visibility("hidden")))
@interface WANotificationWindow : UIWindow
{
    UIView *_backgroundView;
    UITapGestureRecognizer *_tapGestureRecognizer;
    BOOL _forcedToHide;
    BOOL _active;
    id <WANotificationWindowDelegate> _notificationDelegate;
    NSString *_contactJID;
    NSString *_stanzaID;
    NSMutableArray *_messageQueue;
}

+ (id)sharedWindow;
+ (struct CGAffineTransform)windowTransformForInterfaceOrientation:(int)arg1;
+ (struct CGRect)windowFrameForInterfaceOrientation:(int)arg1;
+ (struct CGRect)backgroundViewFrameForInterfaceOrientation:(int)arg1;
@property(retain, nonatomic) NSMutableArray *messageQueue; // @synthesize messageQueue=_messageQueue;
@property(getter=isActive) BOOL active; // @synthesize active=_active;
@property(nonatomic) BOOL forcedToHide; // @synthesize forcedToHide=_forcedToHide;
@property(copy, nonatomic) NSString *stanzaID; // @synthesize stanzaID=_stanzaID;
@property(copy, nonatomic) NSString *contactJID; // @synthesize contactJID=_contactJID;
@property(nonatomic) id <WANotificationWindowDelegate> delegate; // @synthesize delegate=_notificationDelegate;

- (void)applicationWillResignActive:(id)arg1;
- (void)contentViewAnyTouch:(id)arg1;
- (void)contentViewTouchUp:(id)arg1;
- (void)handleTapGesture:(id)arg1;
- (void)closeAction:(id)arg1;
- (void)rotateToStatusBarOrientation;
- (void)didChangeStatusBarFrame:(id)arg1;
- (void)show;
- (void)hideTemporarily;
- (void)hideAnimated:(BOOL)arg1;
- (void)hideIfEmpty;
- (void)removeContentViewsBelowView:(id)arg1;
- (void)removeContentView:(id)arg1 withAnimationDuration:(double)arg2;
- (void)removeContentView:(id)arg1;
- (void)showNextMessage;
- (void)postWAMessage:(id)arg1 duration:(double)arg2 animated:(BOOL)arg3;
- (void)postWAMessage:(id)arg1 duration:(double)arg2;
- (void)configureLegacyContentView:(id)arg1 withChatName:(id)arg2 senderName:(id)arg3 messageText:(id)arg4 profilePicture:(id)arg5;
- (void)configureContentView:(id)arg1 withChatName:(id)arg2 senderName:(id)arg3 messageText:(id)arg4 profilePicture:(id)arg5;
- (id)addContentViewForWAMessage:(id)arg1 profilePicture:(id)arg2;
- (id)blurredBackgroundImage;
- (id)rootViewController;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)arg1;

@end

