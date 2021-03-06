//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

#import "NSFetchedResultsControllerDelegate.h"

@class NSArray, NSFetchedResultsController, NSMutableArray, NSString;

__attribute__((visibility("hidden")))
@interface WAMediaManager : NSObject <NSFetchedResultsControllerDelegate>
{
    NSMutableArray *_chatSessions;
    BOOL _databaseAccessAvailable;
    BOOL _needsReset;
    BOOL _loadOnChatStorageDidLoadDatabase;
    NSFetchedResultsController *_resultsController;
    int _cachedPhotoCount;
    int _cachedVideoCount;
    int _cachedTotalItemCount;
    int _currentMonth;
    int _currentYear;
    NSString *_title;
}

+ (void)initialize;
@property(copy, nonatomic) NSString *title; // @synthesize title=_title;

- (id)titleForHeaderInSection:(int)arg1;
- (int)numberOfRowsInSection:(int)arg1;
- (int)numberOfSections;
- (void)chatStorageDidLoadDatabase:(id)arg1;
- (void)chatStorageWillUnloadDatabase:(id)arg1;
- (void)controllerDidChangeContent:(id)arg1;
- (void)controller:(id)arg1 didChangeObject:(id)arg2 atIndexPath:(id)arg3 forChangeType:(unsigned int)arg4 newIndexPath:(id)arg5;
- (void)controller:(id)arg1 didChangeSection:(id)arg2 atIndex:(unsigned int)arg3 forChangeType:(unsigned int)arg4;
- (void)controllerWillChangeContent:(id)arg1;
- (void)deleteMessagesAtIndexPaths:(id)arg1;
- (id)indexPathOfMessage:(id)arg1;
- (id)messageAtIndexPath:(id)arg1;
- (void)loadIfNeeded;
@property(readonly, nonatomic) unsigned int numberOfVideos;
@property(readonly, nonatomic) unsigned int numberOfPhotos;
- (unsigned int)countOfMessageType:(unsigned int)arg1;
- (BOOL)isResultSetEmpty;
- (void)reset;
- (void)setNeedsReset;
@property(readonly, nonatomic) unsigned int numberOfItems;
- (id)indexPathFromIndex:(unsigned int)arg1;
- (unsigned int)indexFromIndexPath:(id)arg1;
- (BOOL)isGroupChatMedia;
- (void)chatStorageDidReplaceChatSession:(id)arg1;
@property(retain, nonatomic) NSArray *chatSessions;
- (void)updateDateFormatters;
- (void)currentLocaleDidChange:(id)arg1;
- (void)handleSignificantTimeChange:(id)arg1;
- (void)dealloc;
- (id)init;

@end

