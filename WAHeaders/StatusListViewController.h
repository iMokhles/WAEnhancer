//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WATableViewController.h"

#import "StatusEditControllerDelegate.h"
#import "WAStatusListEditViewControllerDelegate.h"

@class NSString, UIBarButtonItem, UIButton, UILabel, UIView, WAProgressHUD;

__attribute__((visibility("hidden")))
@interface StatusListViewController : WATableViewController <WAStatusListEditViewControllerDelegate, StatusEditControllerDelegate>
{
    WAProgressHUD *_progressHUD;
    NSString *_newStatus;
    UIBarButtonItem *_editButton;
    UIBarButtonItem *_addButton;
    UIView *_viewEmptyStatusList;
    UILabel *_labelEmptyStatusList;
    UIView *_viewTableFooter;
    UIButton *_buttonClearStatus;
}

@property(retain, nonatomic) UIButton *buttonClearStatus; // @synthesize buttonClearStatus=_buttonClearStatus;
@property(retain, nonatomic) UIView *viewTableFooter; // @synthesize viewTableFooter=_viewTableFooter;
@property(retain, nonatomic) UILabel *labelEmptyStatusList; // @synthesize labelEmptyStatusList=_labelEmptyStatusList;
@property(retain, nonatomic) UIView *viewEmptyStatusList; // @synthesize viewEmptyStatusList=_viewEmptyStatusList;

- (void)statusEditController:(id)arg1 didSaveStatus:(id)arg2;
- (void)statusEditController:(id)arg1 didAddStatus:(id)arg2;
- (void)statusEditControllerDidCancel:(id)arg1;
- (void)statusListEditViewViewControllerDidFinish:(id)arg1;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (float)tableView:(id)arg1 heightForFooterInSection:(int)arg2;
- (id)tableView:(id)arg1 viewForFooterInSection:(int)arg2;
- (id)tableView:(id)arg1 titleForHeaderInSection:(int)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (void)leaveEditMode;
- (void)editAction:(id)arg1;
- (void)clearStatusAction:(id)arg1;
- (void)addStatusAction:(id)arg1;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (void)viewDidAppear:(BOOL)arg1;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)setStatus:(id)arg1;
- (void)removeHUD;
- (void)showHUD:(id)arg1;
- (void)updateUI;
- (void)dealloc;
- (id)initWithNibName:(id)arg1 bundle:(id)arg2;
- (id)init;

@end
