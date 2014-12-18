//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UINavigationController.h"

#import "GroupViewControllerDelegate.h"
#import "PeopleViewControllerDelegate.h"

@class GroupViewController, NSArray, NSMutableDictionary;

__attribute__((visibility("hidden")))
@interface PeopleMultiPickerNavigationController : UINavigationController <GroupViewControllerDelegate, PeopleViewControllerDelegate>
{
    GroupViewController *_groupController;
    NSMutableDictionary *_peopleViewControllers;
    unsigned int _pickerMode;
    int _selectionLimit;
    int _tag;
    NSArray *_selectedContacts;
}

@property(retain, nonatomic) NSArray *selectedContacts; // @synthesize selectedContacts=_selectedContacts;
@property(nonatomic) int tag; // @synthesize tag=_tag;
@property(nonatomic) int selectionLimit; // @synthesize selectionLimit=_selectionLimit;
@property(nonatomic) unsigned int pickerMode; // @synthesize pickerMode=_pickerMode;

- (void)peopleViewControllerDidCancel:(id)arg1;
- (void)peopleViewController:(id)arg1 didSelectContacts:(id)arg2;
- (void)groupViewControllerDidCancel:(id)arg1;
- (void)groupViewController:(id)arg1 didSelectGroupWithID:(id)arg2;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (void)viewDidLoad;
- (void)loadPeopleViewController:(int)arg1;
- (void)loadGroupViewController;
- (id)initWithDelegate:(id)arg1;

// Remaining properties
@property(nonatomic) id <PeopleMultiPickerNavigationControllerDelegate><UINavigationControllerDelegate> delegate;

@end

