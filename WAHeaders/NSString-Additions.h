//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSString.h"

@interface NSString (Additions)
+ (id)formattedPhoneNumber:(id)arg1 countryCode:(id)arg2;
+ (id)digraphs;
- (id)formattedPhoneNumberFromJID;
- (id)formattedPhoneNumberForCountryCode:(int)arg1;
- (id)formattedPhoneNumber;
- (unsigned int)wa_lengthInCharacters;
- (BOOL)isArabicText;
- (BOOL)isRTLText;
- (BOOL)isEmptyOrWhitespace;
- (id)wa_trimmedStringByNormalizingNewlines;
- (id)wa_trimmedString;
- (id)mimeType;
- (id)tokens;
- (id)upperBoundSearchString;
- (id)normalizedString;
- (id)htmlEncodedString;
@end

