//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "DecFile.h"

@class NSArray, NSDate, NSString, XMPPAckStanza, XMPPChatStateStanza, XMPPIQStanza, XMPPNotificationStanza, XMPPPresenceStanza, XMPPReceiptStanza, XMPPStanza, XMPPStream;

@protocol XMPPStreamDelegate
- (void)xmppStream:(XMPPStream *)arg1 didReceiveCustomStanza:(XMPPStanza *)arg2;
- (void)xmppStream:(XMPPStream *)arg1 didReceiveNotification:(XMPPNotificationStanza *)arg2;
- (void)xmppStream:(XMPPStream *)arg1 didReceiveChatState:(XMPPChatStateStanza *)arg2;
- (void)xmppStream:(XMPPStream *)arg1 didReceiveAck:(XMPPAckStanza *)arg2;
- (void)xmppStream:(XMPPStream *)arg1 didReceiveReceipt:(XMPPReceiptStanza *)arg2;
- (void)xmppStream:(XMPPStream *)arg1 didReceivePresence:(XMPPPresenceStanza *)arg2;
- (void)xmppStream:(XMPPStream *)arg1 didReceiveMessages:(NSArray *)arg2;
- (void)xmppStream:(XMPPStream *)arg1 didReceiveIQ:(XMPPIQStanza *)arg2;
- (void)xmppStreamDidClose:(XMPPStream *)arg1;
- (void)xmppStreamDidOpen:(XMPPStream *)arg1;
- (void)xmppStreamDidNotAuthenticate:(XMPPStream *)arg1;
- (void)xmppStreamDidAuthenticate:(XMPPStream *)arg1 kind:(NSString *)arg2 creation:(NSDate *)arg3 expiration:(NSDate *)arg4 serverTimeShift:(int)arg5;
@end

