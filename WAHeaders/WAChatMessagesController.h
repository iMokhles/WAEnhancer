//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSArray, NSIndexPath, NSManagedObjectID, NSMutableArray, NSString;

__attribute__((visibility("hidden")))
@interface WAChatMessagesController : NSObject
{
    NSMutableArray *_sections;
    BOOL _isGroupChat;
    id <WAChatMessagesControllerDelegate> _delegate;
    NSString *_jid;
    NSManagedObjectID *_highlightedMessageID;
}

@property(readonly, nonatomic) NSArray *sections; // @synthesize sections=_sections;
@property(retain, nonatomic) NSManagedObjectID *highlightedMessageID; // @synthesize highlightedMessageID=_highlightedMessageID;
@property(readonly, nonatomic) NSString *jid; // @synthesize jid=_jid;
@property(nonatomic) id <WAChatMessagesControllerDelegate> delegate; // @synthesize delegate=_delegate;

- (void)prependMessages:(id)arg1;
- (BOOL)appendMessages:(id)arg1 currentUnreadCount:(int)arg2 addingDividerIfNecessary:(BOOL)arg3;
- (void)deleteChatCellDataObjects:(id)arg1;
@property(readonly, nonatomic) NSIndexPath *highlightedMessageIndexPath;
- (void)enumerateChatCellDataUsingBlock:(id)arg1;
- (BOOL)removeUnreadDivider;
- (id)chatCellDataForMessage:(id)arg1;
- (id)allSelectedCellDataObjects;
- (id)allUnsentCellDataObjectsAround:(id)arg1;
- (BOOL)hasEditableMessages;
- (void)removeChatCellDataAtIndexPath:(id)arg1;
- (id)indexPathOfChatCellData:(id)arg1;
- (id)chatCellDataAtIndexPath:(id)arg1;
- (id)indexPathOfRowFollowingRowAtIndexPath:(id)arg1;
@property(readonly, nonatomic) NSIndexPath *bottomMostIndexPath;
- (void)removeAllMessages;
- (id)titleForSection:(int)arg1;
- (int)numberOfRowsInSection:(int)arg1;
- (int)numberOfSections;
- (BOOL)isEmpty;
@property(readonly, nonatomic) NSIndexPath *dividerIndexPath;
- (void)getDay:(int *)arg1 month:(int *)arg2 year:(int *)arg3 fromDate:(id)arg4;
- (void)turnMessagesIntoFaultsIfPossible;
- (id)initWithJID:(id)arg1;

@end

