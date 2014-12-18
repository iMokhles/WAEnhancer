//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WATableViewController.h"

#import "ABDisabledControllerDelegate.h"
#import "ABNewPersonViewControllerDelegate.h"
#import "ABPeoplePickerNavigationControllerDelegate.h"
#import "WAInfoInputViewControllerDelegate.h"

@class NSString, WAAggregateCallEvent, WAMediaManager;

__attribute__((visibility("hidden")))
@interface WAContactInfoBaseViewController : WATableViewController <ABNewPersonViewControllerDelegate, ABDisabledControllerDelegate, ABPeoplePickerNavigationControllerDelegate, WAInfoInputViewControllerDelegate>
{
    struct dispatch_group_s *_blockRequestDispatchGroup;
    int _countOfPendingBlacklistUpdateRequests;
    BOOL _callerIsBlocked;
    WAMediaManager *_mediaManager;
    NSString *_highlightedWhatsAppID;
    NSString *_detailTextForUnknownContact;
    WAAggregateCallEvent *_aggregateCallEvent;
}

+ (id)viewControllerWithContact:(id)arg1 merged:(BOOL)arg2 whatsAppID:(id)arg3 detailText:(id)arg4;
@property(readonly, nonatomic) BOOL callerIsBlocked; // @synthesize callerIsBlocked=_callerIsBlocked;
@property(retain, nonatomic) WAAggregateCallEvent *aggregateCallEvent; // @synthesize aggregateCallEvent=_aggregateCallEvent;
@property(copy, nonatomic) NSString *detailTextForUnknownContact; // @synthesize detailTextForUnknownContact=_detailTextForUnknownContact;
@property(copy, nonatomic) NSString *highlightedWhatsAppID; // @synthesize highlightedWhatsAppID=_highlightedWhatsAppID;
@property(retain, nonatomic) WAMediaManager *mediaManager; // @synthesize mediaManager=_mediaManager;

- (void)callerBlockedStatusDidChange;
- (void)blockOrUnblockCaller;
- (void)abDisabledViewControllerDidCancel:(id)arg1;
- (void)presentDisabledAddressBookViewController;
- (void)peoplePickerNavigationControllerDidCancel:(id)arg1;
- (BOOL)peoplePickerNavigationController:(id)arg1 shouldContinueAfterSelectingPerson:(void *)arg2 property:(int)arg3 identifier:(int)arg4;
- (void)infoInputViewControllerDidCancel:(id)arg1;
- (void)infoInputViewControllerDidFinish:(id)arg1;
- (BOOL)peoplePickerNavigationController:(id)arg1 shouldContinueAfterSelectingPerson:(void *)arg2;
- (void)addWhatsAppIDToExistingContact;
- (void)newPersonViewController:(id)arg1 didCompleteWithNewPerson:(void *)arg2;
- (void)createNewContactFromWhatsAppID;
- (void)sendMessageToUnknownContact;
- (void)callUnknownContact;
- (void)viewAllMedia;
- (void)mediaManagerDidChangeContent:(id)arg1;
- (void)didDeleteMessages;
- (void)chatStorageDidDeleteMessagesInChatSession:(id)arg1;
- (void)didAddMessages;
- (void)chatStorageDidAddMessages:(id)arg1;
- (void)reloadWithContact:(id)arg1;
- (id)headerTextForLinkedContacts;
- (void)dealloc;
- (void)commonInit;

@end

