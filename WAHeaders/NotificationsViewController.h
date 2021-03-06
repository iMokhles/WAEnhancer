//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAStaticTableViewController.h"

#import "SoundPickerDelegate.h"

@class UILabel, UISwitch, UIView, WAActivityLabel, WATableRow;

__attribute__((visibility("hidden")))
@interface NotificationsViewController : WAStaticTableViewController <SoundPickerDelegate>
{
    WAActivityLabel *_activityLabel;
    UIView *_headerView;
    UILabel *_headerLabel;
    WATableRow *_rowMessageSound;
    UISwitch *_switchMessageAlerts;
    WATableRow *_rowGroupSound;
    UISwitch *_switchGroupAlerts;
    WATableRow *_rowCallSound;
    UISwitch *_switchCallAlerts;
    UISwitch *_switchInAppVibrate;
    UISwitch *_switchInAppSounds;
    UISwitch *_switchPreview;
    WATableRow *_rowInAppAlerts;
    WATableRow *_rowResetSettings;
    int _pendingRequestCounter;
    int _iPodPlaybackState;
}

+ (id)controller;

- (void)settingsUpdateFailedWithError:(id)arg1;
- (void)settingsUpdateFinished;
- (void)soundPickerDidCancel:(id)arg1;
- (void)soundPicker:(id)arg1 didFinishWithSound:(id)arg2;
- (float)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (void)applicationWillEnterForeground:(id)arg1;
- (void)willAnimateRotationToInterfaceOrientation:(int)arg1 duration:(double)arg2;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (void)viewWillDisappear:(BOOL)arg1;
- (void)viewDidAppear:(BOOL)arg1;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)inAppSoundsAction:(id)arg1;
- (void)inAppVibrateAction:(id)arg1;
- (void)showPreviewAction:(id)arg1;
- (void)callAlertsAction:(id)arg1;
- (void)groupAlertsAction:(id)arg1;
- (void)messageAlertsAction:(id)arg1;
- (void)setUIEnabled:(BOOL)arg1;
- (void)reloadData;
- (void)resetNotificationSettings;
- (void)askToResetNotificationSettigs;
- (void)showSoundPickerController:(int)arg1;
- (void)updateTableViewHeader;
- (void)hideActivity;
- (void)showActivity:(id)arg1;
- (void)dealloc;
- (id)init;

@end

