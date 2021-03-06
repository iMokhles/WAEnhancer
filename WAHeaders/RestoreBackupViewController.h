//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAViewController.h"

@class NSMetadataQuery, UIBarButtonItem, UILabel, UITableView, UIView, WABackupInfoTableCell;

__attribute__((visibility("hidden")))
@interface RestoreBackupViewController : WAViewController
{
    UIBarButtonItem *_barButtonNext;
    NSMetadataQuery *_backupQuery;
    BOOL _backupDownloaded;
    BOOL _waitingForBackupToDownload;
    long long _backupSize;
    float _downloadProgress;
    BOOL _allowsUserToSkipRestore;
    id <RestoreBackupViewControllerDelegate> _delegate;
    UITableView *_tableViewRestore;
    WABackupInfoTableCell *_cellBackupInfo;
    UIView *_viewNoiCloud;
    UILabel *_labelNoiCloud;
    UIView *_viewTableFooter;
    UILabel *_labelProgressInfo;
    UILabel *_labelFooterText;
}

@property(retain, nonatomic) UILabel *labelFooterText; // @synthesize labelFooterText=_labelFooterText;
@property(retain, nonatomic) UILabel *labelProgressInfo; // @synthesize labelProgressInfo=_labelProgressInfo;
@property(retain, nonatomic) UIView *viewTableFooter; // @synthesize viewTableFooter=_viewTableFooter;
@property(retain, nonatomic) UILabel *labelNoiCloud; // @synthesize labelNoiCloud=_labelNoiCloud;
@property(retain, nonatomic) UIView *viewNoiCloud; // @synthesize viewNoiCloud=_viewNoiCloud;
@property(retain, nonatomic) WABackupInfoTableCell *cellBackupInfo; // @synthesize cellBackupInfo=_cellBackupInfo;
@property(retain, nonatomic) UITableView *tableViewRestore; // @synthesize tableViewRestore=_tableViewRestore;
@property(nonatomic) id <RestoreBackupViewControllerDelegate> delegate; // @synthesize delegate=_delegate;
@property(nonatomic) BOOL allowsUserToSkipRestore; // @synthesize allowsUserToSkipRestore=_allowsUserToSkipRestore;

- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 willSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (float)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (void)viewDidDisappear:(BOOL)arg1;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)nextAction:(id)arg1;
- (void)iCloudBackupUpdated:(id)arg1;
- (void)iCloudQueryUpdated:(id)arg1;
- (void)iCloudFinishedGathering:(id)arg1;
- (void)checkFreeSpaceAndRestore;
- (void)startRestoreSequence:(BOOL)arg1;
- (void)processFiles:(id)arg1;
- (void)restoreFromBackup;
- (void)checkForBackup;
- (void)reloadBackupInfoAndState;
- (void)setProgressText:(id)arg1 footerText:(id)arg2;
- (id)footerTextForBackupProgress:(float)arg1;
@property(readonly, nonatomic) BOOL backupRestored;
- (void)stopAnimatingGears;
- (void)startAnimatingGears;
- (void)dealloc;
- (id)initWithDelegate:(id)arg1;

@end

