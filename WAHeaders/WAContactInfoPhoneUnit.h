//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAContactInfoUnit.h"

@class NSManagedObjectID, WAStatus;

__attribute__((visibility("hidden")))
@interface WAContactInfoPhoneUnit : WAContactInfoUnit
{
    NSManagedObjectID *_waStatusID;
}

+ (id)contactInfoPhoneUnitForWAPhone:(id)arg1;
@property(retain, nonatomic) NSManagedObjectID *waStatusID; // @synthesize waStatusID=_waStatusID;

@property(readonly, nonatomic) WAStatus *waStatus;
- (id)valueText;
- (id)initWithWAPhone:(id)arg1;

@end

