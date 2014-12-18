//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WABubbleView.h"

#import "ABNewPersonViewControllerDelegate.h"
#import "ABPeoplePickerNavigationControllerDelegate.h"
#import "ABPersonViewControllerDelegate.h"
#import "WAInfoInputViewControllerDelegate.h"

@class NSArray, TextBlock;

__attribute__((visibility("hidden")))
@interface WATextBubbleView : WABubbleView <ABNewPersonViewControllerDelegate, ABPeoplePickerNavigationControllerDelegate, WAInfoInputViewControllerDelegate, ABPersonViewControllerDelegate>
{
    NSArray *_accessibleElements;
    TextBlock *_selectedTextBlock;
    BOOL _actionSheetShown;
    NSArray *_messages;
}

+ (struct CGSize)sizeForMessages:(id)arg1 maxWidth:(float)arg2 timestampString:(id)arg3 messageStatus:(unsigned int)arg4 fromName:(id)arg5 pushName:(id)arg6 showListIcon:(BOOL)arg7 isIncoming:(BOOL)arg8;
+ (struct CGSize)sizeForName:(id)arg1 pushName:(id)arg2 maxWidth:(float)arg3;
@property(retain, nonatomic) NSArray *messages; // @synthesize messages=_messages;

- (int)indexOfAccessibilityElement:(id)arg1;
- (id)accessibilityElementAtIndex:(int)arg1;
- (int)accessibilityElementCount;
- (void)updateAccessibilityInfo;
- (BOOL)isAccessibilityElement;
- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (void)infoInputViewControllerDidCancel:(id)arg1;
- (void)infoInputViewControllerDidFinish:(id)arg1;
- (void)peoplePickerNavigationControllerDidCancel:(id)arg1;
- (BOOL)peoplePickerNavigationController:(id)arg1 shouldContinueAfterSelectingPerson:(void *)arg2 property:(int)arg3 identifier:(int)arg4;
- (BOOL)peoplePickerNavigationController:(id)arg1 shouldContinueAfterSelectingPerson:(void *)arg2;
- (void)continueEditingPerson:(void *)arg1 onNavigationController:(id)arg2;
- (BOOL)personViewController:(id)arg1 shouldPerformDefaultActionForPerson:(void *)arg2 property:(int)arg3 identifier:(int)arg4;
- (void)newPersonViewController:(id)arg1 didCompleteWithNewPerson:(void *)arg2;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (void)drawRect:(struct CGRect)arg1;
- (id)bubbleText;
- (void)addFieldToContact;
- (void)createNewContact;
- (void)setAddressForPerson:(void *)arg1;
- (void)launchSkype;
- (void)launchSparrow;
- (void)launchGmail;
- (void)openUrl;
- (void)showActionSheet;
- (void)highlightUrl:(BOOL)arg1;
- (id)initWithIncomingState:(BOOL)arg1 delegate:(id)arg2;

@end

