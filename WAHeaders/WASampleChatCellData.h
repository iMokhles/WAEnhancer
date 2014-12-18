//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAChatCellData.h"

__attribute__((visibility("hidden")))
@interface WASampleChatCellData : WAChatCellData
{
    BOOL _incoming;
    unsigned int _type;
}

+ (id)cellDataWithText:(id)arg1 isIncoming:(BOOL)arg2;
- (id)nameColor;
- (id)shortName;
- (id)pushName;
- (id)fromName;
- (id)messageID;
- (BOOL)needToShowAlert;
- (BOOL)isSenderUnknown;
- (BOOL)isGroupMessage;
- (BOOL)isSending;
- (BOOL)isFromMe;
- (id)messageTimestampString;
- (unsigned int)messageStatus;
- (unsigned int)mediaOrigin;
- (unsigned int)messageType;
- (id)message;
- (id)initWithText:(id)arg1 isIncoming:(BOOL)arg2;

@end
