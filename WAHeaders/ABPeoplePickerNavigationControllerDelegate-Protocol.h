//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class ABPeoplePickerNavigationController;

@protocol ABPeoplePickerNavigationControllerDelegate <NSObject>
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)arg1 shouldContinueAfterSelectingPerson:(void *)arg2 property:(int)arg3 identifier:(int)arg4;
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)arg1 shouldContinueAfterSelectingPerson:(void *)arg2;
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)arg1;
@end

