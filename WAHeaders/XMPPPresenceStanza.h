//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "XMPPStanza.h"

@class NSString;

__attribute__((visibility("hidden")))
@interface XMPPPresenceStanza : XMPPStanza
{
}

+ (unsigned int)typeForString:(id)arg1;
+ (id)stringForType:(unsigned int)arg1;
+ (id)stringsForTypes;
- (id)log;
@property(retain, nonatomic) NSString *nickname;
@property(nonatomic) unsigned int type;
- (id)initWithFromJID:(id)arg1 toJID:(id)arg2 type:(unsigned int)arg3;

@end

