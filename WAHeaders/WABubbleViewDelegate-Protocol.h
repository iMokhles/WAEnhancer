//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSString, NSURL, WABubbleView;

@protocol WABubbleViewDelegate <NSObject>
- (void)replyMessageSenderFromBubbleView:(WABubbleView *)arg1;
- (void)addMessageSenderInBubbleView:(WABubbleView *)arg1;
- (void)deleteMessageInBubbleView:(WABubbleView *)arg1;
- (void)forwardMessageInBubbleView:(WABubbleView *)arg1;
- (void)copyMessageInBubbleView:(WABubbleView *)arg1;
- (void)openURL:(NSURL *)arg1 fromBubbleView:(WABubbleView *)arg2;
- (void)handleDoubleTapActionInBubbleView:(WABubbleView *)arg1;
- (void)handleSingleTapActionInBubbleView:(WABubbleView *)arg1;
- (BOOL)canPerformDoubleTapActionInBubbleView:(WABubbleView *)arg1;
- (BOOL)canPerformSingleTapActionInBubbleView:(WABubbleView *)arg1;
- (BOOL)canDimBubbleView:(WABubbleView *)arg1;
- (BOOL)bubbleView:(WABubbleView *)arg1 canPerformAction:(SEL)arg2 withSender:(id)arg3;
- (void)setHighlightState:(BOOL)arg1 forBubbleView:(WABubbleView *)arg2 animated:(BOOL)arg3;
- (NSString *)shortNameForBubbleView:(WABubbleView *)arg1;
@end

