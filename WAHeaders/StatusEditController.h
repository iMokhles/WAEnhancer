//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WATableViewController.h"

#import "UITextViewDelegate.h"

@class NSDictionary, NSString, UITableViewCell, UITextView;

__attribute__((visibility("hidden")))
@interface StatusEditController : WATableViewController <UITextViewDelegate>
{
    float _keyboardHeight;
    UITableViewCell *_textViewCell;
    UITextView *_textView;
    id <StatusEditControllerDelegate> _delegate;
    NSDictionary *_currentStatus;
    NSString *_preloadedStatusText;
}

@property(retain, nonatomic) NSString *preloadedStatusText; // @synthesize preloadedStatusText=_preloadedStatusText;
@property(retain, nonatomic) NSDictionary *currentStatus; // @synthesize currentStatus=_currentStatus;

- (void)keyboardWillShow:(id)arg1;
- (id)tableView:(id)arg1 willSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (float)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (BOOL)textView:(id)arg1 shouldChangeTextInRange:(struct _NSRange)arg2 replacementText:(id)arg3;
- (void)textViewDidChange:(id)arg1;
- (void)textViewDidBeginEditing:(id)arg1;
- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4;
- (void)saveAction:(id)arg1;
- (void)cancelAction:(id)arg1;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (void)viewWillDisappear:(BOOL)arg1;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)updateNavigationBar;
- (void)dealloc;
- (id)initWithDelegate:(id)arg1;
- (id)init;

@end
