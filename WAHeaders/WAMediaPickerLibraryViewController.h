//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAMediaPickerBaseViewController.h"

@class WAMediaPickerLibraryController;

__attribute__((visibility("hidden")))
@interface WAMediaPickerLibraryViewController : WAMediaPickerBaseViewController
{
    BOOL _preparingToPresentAlbum;
    BOOL _libraryAvailable;
    WAMediaPickerLibraryController *_libraryController;
}

+ (id)controller;
@property(retain, nonatomic) WAMediaPickerLibraryController *libraryController; // @synthesize libraryController=_libraryController;

- (id)tableView:(id)arg1 willSelectRowAtIndexPath:(id)arg2;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (id)initWithNibName:(id)arg1 bundle:(id)arg2;

@end
