//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "XMPPStanza.h"

@class NSString;

__attribute__((visibility("hidden")))
@interface XMPPNotificationStanza : XMPPStanza
{
}

+ (unsigned int)typeForString:(id)arg1;
+ (id)stringForType:(unsigned int)arg1;
+ (id)stringsForTypes;
@property(readonly, nonatomic) NSString *text;
@property(nonatomic) unsigned int type;
- (id)initWithType:(unsigned int)arg1;

@end

