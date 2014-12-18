//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSMutableDictionary;

__attribute__((visibility("hidden")))
@interface EmojiConverter : NSObject
{
    NSMutableDictionary *_dictAppleToStandard;
    NSMutableDictionary *_dictStandardToApple;
    BOOL _convertEmoji;
}

+ (id)sharedConverter;

- (id)stripEmoji:(id)arg1;
- (id)convertOutgoingEmojiString:(id)arg1;
- (id)convertIncomingEmojiString:(id)arg1;
- (id)standardToApple:(id)arg1;
- (id)appleToStandard:(id)arg1;
- (BOOL)composedCharacterSequenceIsRegionalIndicatorSymbol:(id)arg1;
- (id)init;

@end
