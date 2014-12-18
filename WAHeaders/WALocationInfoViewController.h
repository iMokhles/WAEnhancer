//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WATableViewController.h"

#import "ABPersonViewControllerDelegate.h"

@class CLLocation, MKPlacemark, NSString, UIView, WAContactInfoNameUnit, WAContactInfoPhotoUnit, WAContactInfoTableHeaderView;

__attribute__((visibility("hidden")))
@interface WALocationInfoViewController : WATableViewController <ABPersonViewControllerDelegate>
{
    NSString *_formattedAddress;
    WAContactInfoTableHeaderView *_tableHeader;
    WAContactInfoNameUnit *_contactNameUnit;
    WAContactInfoPhotoUnit *_contactPhotoUnit;
    UIView *_actionsSectionHeaderView;
    MKPlacemark *_placemark;
    NSString *_contactName;
    int _contactID;
    CLLocation *_currentLocation;
}

+ (id)controller;
@property(retain, nonatomic) CLLocation *currentLocation; // @synthesize currentLocation=_currentLocation;
@property(nonatomic) int contactID; // @synthesize contactID=_contactID;
@property(retain, nonatomic) NSString *contactName; // @synthesize contactName=_contactName;
@property(retain, nonatomic) MKPlacemark *placemark; // @synthesize placemark=_placemark;

- (BOOL)personViewController:(id)arg1 shouldPerformDefaultActionForPerson:(void *)arg2 property:(int)arg3 identifier:(int)arg4;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (void)tableView:(id)arg1 willDisplayCell:(id)arg2 forRowAtIndexPath:(id)arg3;
- (float)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 viewForHeaderInSection:(int)arg2;
- (float)tableView:(id)arg1 heightForHeaderInSection:(int)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (id)actionsSectionHeaderView;
- (void)reloadTableHeader;
- (void)directionsToHere;
- (void)addToContacts;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (void)viewDidAppear:(BOOL)arg1;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)dealloc;
- (id)initWithStyle:(int)arg1;

@end

