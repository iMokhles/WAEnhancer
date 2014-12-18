//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAViewController.h"

@class NSArray, UILabel, UITableView, UITableViewCell;

__attribute__((visibility("hidden")))
@interface SinglePersonPicker : WAViewController
{
    id <SinglePersonPickerDelegate> _delegate;
    NSArray *_sections;
    NSArray *_searchResults;
    int _numberOfContacts;
    BOOL _dataAvailable;
    BOOL _showActionCells;
    unsigned int _pickerMode;
    int _tag;
    UITableView *_tableView;
    UILabel *_labelLoading;
    UITableViewCell *_cellLoading;
    UILabel *_labelNoContacts;
    UITableViewCell *_cellNoContacts;
}

@property(nonatomic) id <SinglePersonPickerDelegate> delegate; // @synthesize delegate=_delegate;
@property(retain, nonatomic) UITableViewCell *cellNoContacts; // @synthesize cellNoContacts=_cellNoContacts;
@property(retain, nonatomic) UILabel *labelNoContacts; // @synthesize labelNoContacts=_labelNoContacts;
@property(retain, nonatomic) UITableViewCell *cellLoading; // @synthesize cellLoading=_cellLoading;
@property(retain, nonatomic) UILabel *labelLoading; // @synthesize labelLoading=_labelLoading;
@property(retain, nonatomic) UITableView *tableView; // @synthesize tableView=_tableView;
@property(nonatomic) int tag; // @synthesize tag=_tag;
@property(nonatomic) BOOL showActionCells; // @synthesize showActionCells=_showActionCells;
@property(nonatomic) unsigned int pickerMode; // @synthesize pickerMode=_pickerMode;

- (void)fontSizeDidChange:(id)arg1;
- (void)contactsStorageDidUpdateContacts:(id)arg1;
- (void)contactsStorageDidUpdateStatus:(id)arg1;
- (void)searchDisplayControllerDidEndSearch:(id)arg1;
- (void)searchDisplayControllerWillEndSearch:(id)arg1;
- (void)searchDisplayControllerDidBeginSearch:(id)arg1;
- (void)searchDisplayControllerWillBeginSearch:(id)arg1;
- (BOOL)searchDisplayController:(id)arg1 shouldReloadTableForSearchString:(id)arg2;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 willSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (float)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (float)tableView:(id)arg1 heightForHeaderInSection:(int)arg2;
- (int)tableView:(id)arg1 sectionForSectionIndexTitle:(id)arg2 atIndex:(int)arg3;
- (id)sectionIndexTitlesForTableView:(id)arg1;
- (id)tableView:(id)arg1 titleForHeaderInSection:(int)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (void)searchWithCriteria:(id)arg1;
- (void)willAnimateRotationToInterfaceOrientation:(int)arg1 duration:(double)arg2;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (void)viewDidLayoutSubviews;
- (void)viewDidDisappear:(BOOL)arg1;
- (void)viewDidAppear:(BOOL)arg1;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)cancelAction:(id)arg1;
- (void)adjustSearchbarPositionAndTableviewInsets;
- (void)checkDataAvailability:(id)arg1;
- (void)setupDisplayList;
- (void)updateTableHeader;
- (BOOL)displayActionButtons;
- (BOOL)displaySearchBar;
- (void)saveTableScrollPosition;
- (void)restoreTableScrollPosition;
- (void)dealloc;
- (id)initWithDelegate:(id)arg1;

@end

