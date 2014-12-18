//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSString;

__attribute__((visibility("hidden")))
@interface WAContactInfoNameUnit : NSObject
{
    NSString *_prefix;
    NSString *_firstName;
    NSString *_phoneticFirstName;
    NSString *_middleName;
    NSString *_phoneticMiddleName;
    NSString *_lastName;
    NSString *_phoneticLastName;
    NSString *_suffix;
    NSString *_nickname;
    NSString *_jobTitle;
    NSString *_department;
    NSString *_organization;
    unsigned int _nameFormat;
}

+ (id)contactInfoNameUnitForRecord:(void *)arg1;
@property(readonly, nonatomic) unsigned int nameFormat; // @synthesize nameFormat=_nameFormat;
@property(readonly, nonatomic) NSString *organization; // @synthesize organization=_organization;
@property(readonly, nonatomic) NSString *department; // @synthesize department=_department;
@property(readonly, nonatomic) NSString *jobTitle; // @synthesize jobTitle=_jobTitle;
@property(readonly, nonatomic) NSString *nickname; // @synthesize nickname=_nickname;
@property(readonly, nonatomic) NSString *suffix; // @synthesize suffix=_suffix;
@property(readonly, nonatomic) NSString *phoneticLastName; // @synthesize phoneticLastName=_phoneticLastName;
@property(readonly, nonatomic) NSString *lastName; // @synthesize lastName=_lastName;
@property(readonly, nonatomic) NSString *phoneticMiddleName; // @synthesize phoneticMiddleName=_phoneticMiddleName;
@property(readonly, nonatomic) NSString *middleName; // @synthesize middleName=_middleName;
@property(readonly, nonatomic) NSString *phoneticFirstName; // @synthesize phoneticFirstName=_phoneticFirstName;
@property(readonly, nonatomic) NSString *firstName; // @synthesize firstName=_firstName;
@property(readonly, nonatomic) NSString *prefix; // @synthesize prefix=_prefix;

- (id)initWithRecord:(void *)arg1;

@end
