//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "DecFile.h"

@class InetAddress, NSData, NSString, XMPPSocket;

@protocol XMPPSocketDelegate <NSObject>

@optional
- (void)onSocketDidDisconnect:(XMPPSocket *)arg1;
- (void)onSocket:(XMPPSocket *)arg1 didWriteDataWithTag:(long)arg2;
- (void)onSocket:(XMPPSocket *)arg1 didReadData:(NSData *)arg2 withTag:(long)arg3;
- (void)onSocket:(XMPPSocket *)arg1 didConnectToHost:(NSString *)arg2 port:(unsigned short)arg3;
- (void)onSocket:(XMPPSocket *)arg1 willConnectToHost:(InetAddress *)arg2;
@end
