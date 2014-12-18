//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WATableViewController.h"

#import "UISearchBarDelegate.h"
#import "UISearchDisplayDelegate.h"
#import "UITableViewDataSource.h"
#import "UITableViewDelegate.h"

@class CountryInfo, NSArray, NSMutableArray, UISearchDisplayController;

__attribute__((visibility("hidden")))
@interface WACountryPickerController : WATableViewController <UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_preferredCountries;
    NSArray *_otherCountries;
    NSMutableArray *_searchResults;
    UISearchDisplayController *_searchController;
    CountryInfo *_selectedCountry;
    id <WACountryPickerControllerDelegate> _delegate;
}

+ (id)controllerWithDelegate:(id)arg1;
@property(nonatomic) id <WACountryPickerControllerDelegate> delegate; // @synthesize delegate=_delegate;
@property(retain, nonatomic) CountryInfo *selectedCountry; // @synthesize selectedCountry=_selectedCountry;

- (void)searchDisplayControllerDidEndSearch:(id)arg1;
- (void)searchDisplayControllerWillBeginSearch:(id)arg1;
- (BOOL)searchDisplayController:(id)arg1 shouldReloadTableForSearchString:(id)arg2;
- (void)filterContentForSearchText:(id)arg1;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 willSelectRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 editingStyleForRowAtIndexPath:(id)arg2;
- (float)tableView:(id)arg1 heightForFooterInSection:(int)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 titleForFooterInSection:(int)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (void)viewDidAppear:(BOOL)arg1;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)dealloc;
- (id)initWithDelegate:(id)arg1;

@end

