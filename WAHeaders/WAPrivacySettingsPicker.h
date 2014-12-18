//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAStaticTableViewController.h"

@class NSDate, NSString, WAActivityLabel, WAPrivacyPolicy, WATableRow;

__attribute__((visibility("hidden")))
@interface WAPrivacySettingsPicker : WAStaticTableViewController
{
    WATableRow *_nooneRow;
    WATableRow *_contactsRow;
    WATableRow *_allUsersRow;
    WAActivityLabel *_activityLabel;
    NSDate *_activityStartTime;
    unsigned int _privacyCategory;
    NSString *_titleString;
    WAPrivacyPolicy *_privacyPolicy;
}

@property(retain) WAPrivacyPolicy *privacyPolicy; // @synthesize privacyPolicy=_privacyPolicy;

- (void)privacyPolicyDidChange:(id)arg1;
- (void)hideActivity;
- (void)showActivity;
- (void)selectValue:(unsigned int)arg1;
- (void)updateCheckMarks;
- (void)viewDidLoad;
- (void)dealloc;
- (id)initForCategory:(unsigned int)arg1 title:(id)arg2;

@end
