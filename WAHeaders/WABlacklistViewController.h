//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WATableViewController.h"

#import "SinglePersonPickerDelegate.h"
#import "WANavigationControllerPopDeferring.h"

@class NSMutableArray, WAProgressHUD;

__attribute__((visibility("hidden")))
@interface WABlacklistViewController : WATableViewController <SinglePersonPickerDelegate, WANavigationControllerPopDeferring>
{
    NSMutableArray *_blacklistItems;
    NSMutableArray *_synchronizedItems;
    BOOL _synchronizationInProgress;
    BOOL _needsSynchronization;
    BOOL _lastSyncWasSuccessful;
    struct dispatch_group_s *_updateDispatchGroup;
    WAProgressHUD *_progressHUD;
    BOOL _popDeferred;
    id <WABlacklistViewControllerDelegate> _delegate;
}

+ (id)controller;
@property(nonatomic) id <WABlacklistViewControllerDelegate> delegate; // @synthesize delegate=_delegate;

- (id)excludedJIDsForSinglePersonPicker:(id)arg1;
- (void)singlePersonPicker:(id)arg1 didSelectContact:(id)arg2;
- (void)singlePersonPickerDidCancel:(id)arg1;
- (void)addPerson;
- (id)tableView:(id)arg1 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)arg2;
- (float)tableView:(id)arg1 heightForFooterInSection:(int)arg2;
- (id)tableView:(id)arg1 titleForFooterInSection:(int)arg2;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 willSelectRowAtIndexPath:(id)arg2;
- (void)tableView:(id)arg1 commitEditingStyle:(int)arg2 forRowAtIndexPath:(id)arg3;
- (BOOL)tableView:(id)arg1 canEditRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (void)removeHUD;
- (void)showHUD;
- (void)navigationControllerDidDeferPop:(id)arg1;
- (void)removeBlacklistItem:(id)arg1;
- (void)addBlacklistItem:(id)arg1;
- (void)sendBlacklistToServer;
- (void)synchronize;
- (void)showUnableToMakeChangesError;
- (BOOL)canMakeChanges;
- (void)updateInterface;
- (void)reloadBlacklistItems;
- (void)xmppConnectionStateDidChange:(id)arg1;
- (void)viewDidLoad;
- (void)dealloc;
- (id)initWithStyle:(int)arg1;

@end

