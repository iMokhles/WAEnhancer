//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSArray, NSIndexSet, WAChatMessagesController;

@protocol WAChatMessagesControllerDelegate <NSObject>
- (void)controllerDidChangeContent:(WAChatMessagesController *)arg1;
- (void)controller:(WAChatMessagesController *)arg1 didInsertIndexPaths:(NSArray *)arg2;
- (void)controller:(WAChatMessagesController *)arg1 didInsertSections:(NSIndexSet *)arg2;
- (void)controller:(WAChatMessagesController *)arg1 didReloadIndexPaths:(NSArray *)arg2;
- (void)controller:(WAChatMessagesController *)arg1 didRemoveSections:(NSIndexSet *)arg2;
- (void)controller:(WAChatMessagesController *)arg1 didRemoveIndexPaths:(NSArray *)arg2;
- (void)controllerWillChangeContent:(WAChatMessagesController *)arg1;
@end

