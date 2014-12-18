//
//  iDevTCk.h
//  Rendarya
//
//  Created by iMokhles on 4/7/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DecFile.h"
#import "../../AESCrypt.h"
#import "../../NSString+UAObfuscatedString.h"

// change all number to any other 4 numbers to not conflict with Rendarya Check

#define HELWAA 1803
#define PIRACYTHESHOLD 1 

OBJC_EXTERN CFStringRef MGCopyAnswer(CFStringRef key) WEAK_IMPORT_ATTRIBUTE;

@interface iMasrok : NSObject
+ (int)masroka;
+(NSString *)SHA1OfPath:(NSString *)path;
@end

enum {
    KDPirated = 2505,
    KDUserI = 0202,
} PiratedChecks;
static int userDICheck() __attribute__((always_inline));
