//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSManagedObject.h"

@class NSDate, NSNumber, NSString, WAChatSession, WAGroupMember;

__attribute__((visibility("hidden")))
@interface WAGroupInfo : NSManagedObject
{
}


// Remaining properties
@property(retain, nonatomic) WAChatSession *chatSession; // @dynamic chatSession;
@property(retain, nonatomic) NSDate *creationDate; // @dynamic creationDate;
@property(retain, nonatomic) WAGroupMember *lastMessageOwner; // @dynamic lastMessageOwner;
@property(retain, nonatomic) NSString *ownerJID; // @dynamic ownerJID;
@property(retain, nonatomic) NSString *pictureID; // @dynamic pictureID;
@property(retain, nonatomic) NSString *picturePath; // @dynamic picturePath;
@property(retain, nonatomic) NSNumber *state; // @dynamic state;
@property(retain, nonatomic) NSString *subjectOwnerJID; // @dynamic subjectOwnerJID;
@property(retain, nonatomic) NSDate *subjectTimestamp; // @dynamic subjectTimestamp;
@end

