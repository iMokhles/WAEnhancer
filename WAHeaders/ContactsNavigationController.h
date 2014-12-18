//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAImageToImageTransitionNavigationController.h"

#import "GroupViewControllerDelegate.h"

@class GroupViewController, NSMutableDictionary;

__attribute__((visibility("hidden")))
@interface ContactsNavigationController : WAImageToImageTransitionNavigationController <GroupViewControllerDelegate>
{
    GroupViewController *_groupController;
    NSMutableDictionary *_contactViewControllers;
}


- (void)groupViewController:(id)arg1 didSelectGroupWithID:(id)arg2;
- (id)init;
- (void)popToContactsViewControllerAnimated:(BOOL)arg1;
- (void)reloadViewControllers;
- (void)loadContactsViewController:(int)arg1;
- (void)loadGroupViewController;

@end
