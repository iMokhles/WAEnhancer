//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSDate, NSString;

__attribute__((visibility("hidden")))
@interface WAMediaCacheItem : NSObject
{
    NSString *_path;
    NSString *_hash;
    NSDate *_timestamp;
}

+ (void)insertMediaCacheItemWithReferenceURL:(id)arg1 storedAtPath:(id)arg2;
+ (id)mediaCacheItemForReferenceURL:(id)arg1;
@property(retain, nonatomic) NSDate *timestamp; // @synthesize timestamp=_timestamp;
@property(retain, nonatomic) NSString *hash; // @synthesize hash=_hash;
@property(retain, nonatomic) NSString *path; // @synthesize path=_path;

- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;

@end

