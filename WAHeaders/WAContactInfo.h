//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSString;

__attribute__((visibility("hidden")))
@interface WAContactInfo : NSObject
{
    int _addressBookID;
    NSString *_fullName;
    NSString *_firstName;
    NSString *_placeholderName;
    NSString *_jid;
}

+ (id)contactInfoWithDictionary:(id)arg1;
@property(copy, nonatomic) NSString *jid; // @synthesize jid=_jid;
@property(copy, nonatomic) NSString *placeholderName; // @synthesize placeholderName=_placeholderName;
@property(copy, nonatomic) NSString *firstName; // @synthesize firstName=_firstName;
@property(copy, nonatomic) NSString *fullName; // @synthesize fullName=_fullName;
@property(nonatomic) int addressBookID; // @synthesize addressBookID=_addressBookID;


@end

