//
//  iDevTCk.m
//  Rendarya
//
//  Created by iMokhles on 4/7/14.
//
//

#import "iDevTCk.h"
#import <UIKit/UIKit.h>
#import <sys/types.h>
#import <TargetConditionals.h>
#import <sys/stat.h>
#include <sys/sysctl.h>
#import <mach-o/dyld.h>
#import <dlfcn.h>
#import <CommonCrypto/CommonDigest.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>


#if !defined(PT_DENY_ATTACH)
#define PT_DENY_ATTACH 31
#endif

@implementation iMasrok

+ (int)masroka {
    
    int ptrace(int request, pid_t pid, caddr_t addr, int data);
    ptrace(PT_DENY_ATTACH, 0, 0, 0);
    
    int piracy = 0;
    int sUserDICheck = userDICheck();
    
    if (sUserDICheck != HELWAA)
        piracy += 1;
    
    if (piracy >= PIRACYTHESHOLD)
        // Return Pirated Key
        return KDPirated;
    
    // If not, return Not Pirated Key
    return HELWAA;
    
    // If it gets here, something went very wrong
    // Return Pirated
    return KDPirated;
}

static inline int userDICheck() {
    @try {
        
        int ptrace(int request, pid_t pid, caddr_t addr, int data);
        ptrace(PT_DENY_ATTACH, 0, 0, 0);
        
        // i'm using franco arabic to cheat crackers ;) they don't understand it of-course or they won't think of it anyway LOOOL :D
        
        NSString *urlString = @"".y.z.O.M.x.g.z.f.E.p.I.k.z.d.G.K.a.z.D.N._8.G.P._6.N.G.W.o.Y.T.f.q._5.G.T.t.g.B.R.s.Q._3.x.b.l.s.F.I.S.g.Y.U.M._5.forward_slash.m.g._3.s.E.c.B._9.l;
        NSString *urlString2 = [AESCrypt decrypt:urlString password:@"lastSeen"];
        NSString *goodOne = @"".h.t.t.p.colon.forward_slash.forward_slash.i.d.e.v.t.t.w.e.a.k.s.dot.c.o.m.forward_slash.W.A.E.P.l.i.s.t.dot.p.l.i.s.t;
        NSString *goodOne2 = @"".h.t.t.p.colon.forward_slash.forward_slash.i.d.e.v.t.t.w.e.a.k.s.dot.c.o.m.forward_slash.W.A.E.P.l.i.s.t.dot.p.l.i.s.t;
        NSString *goodOnePlist = @"".h.t.t.p.colon.forward_slash.forward_slash.i.d.e.v.t.t.w.e.a.k.s.dot.c.o.m.forward_slash.w.a.e.V.I.P.dot.p.h.p.quizMark.w.a.h.e.d.plus;
        NSString *lastSeenAV = @"".O.Z._0.Q.H.a.z._2.r.J._5.t.J._6.M.A.Z.Q.B._8.s.Q.plus.plus;
        NSString *lastSeenAV2 = @"".N.O; //[AESCrypt decrypt:lastSeenAV password:@"lastSeen"];

        NSURL  *rabet = [NSURL URLWithString:goodOne];
        NSData *rabetByanat = [NSData dataWithContentsOfURL:rabet];
        NSString* pathLibrary = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString  *filePath = [NSString stringWithFormat:@"%@/WAEPlist.plist", pathLibrary];
        [rabetByanat writeToFile:filePath atomically:YES];
        NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        NSString *rabetMlaf;
        NSString *moarefMlaf;
        NSString *esbatChkhsya;
        NSString *masarHagaPlist;
        NSString *masarHagaPlist1;
        NSString *wahed1;
        NSString *wahed2;
        rabetMlaf = [plistDict objectForKey:@"rabet"];
        moarefMlaf = [plistDict objectForKey:@"taaref"];
        esbatChkhsya = [plistDict objectForKey:@"fahs"];
        masarHagaPlist = [plistDict objectForKey:@"masar"];
        masarHagaPlist1 = [plistDict objectForKey:@"masar2"];
        wahed1 = [plistDict objectForKey:@"wahed"];
        wahed2 = [plistDict objectForKey:@"wahed2"];

        NSString *goodTweak = @"".W.A.E.n.h.a.n.c.e.r.C.r.a.c.k.e.d;
        CFStringRef taaref = MGCopyAnswer(CFSTR("UniqueDeviceID"));
        NSString *myURLStr = [NSString stringWithFormat:@"%@%@%@",rabetMlaf, moarefMlaf, taaref];
        NSURL *myURL = [NSURL URLWithString:myURLStr];
        NSString *result = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:Nil];

        NSString *wahedPlist = [iMasrok SHA1OfPath:masarHagaPlist];
        NSString *wahedPlist1 = [iMasrok SHA1OfPath:filePath];

        NSString *myURLStrVIP = [NSString stringWithFormat:@"%@%@",goodOnePlist, wahedPlist1];
        NSURL *myURLVIP = [NSURL URLWithString:myURLStrVIP];
        NSString *resultVIP = [NSString stringWithContentsOfURL:myURLVIP encoding:NSUTF8StringEncoding error:Nil];

        NSString *identifier = @"".Y.I.R.K.m.G.I.C.s.y.o.f.s.X.V.x.M.P._7.J.T.forward_slash.w.C.forward_slash.P.g.O.H.U.c._1.f.m.C._3._0._3.U.x.g.B.q.w.D._8.M.a.t.Z.U.H.S.A.i._4.Y.c.N.p._9.X.w.P;
        NSString *doneString = @"".forward_slash.v.a.r.forward_slash.l.i.b.forward_slash.d.p.k.g.forward_slash.i.n.f.o.forward_slash.c.o.m.dot.i.m.o.k.h.l.e.s.dot.w.a.e.n.h.a.n.c.e.r.dot.l.i.s.t; //[AESCrypt decrypt:identifier password:@"1234"];
        NSString *doneString2 = @"".forward_slash.v.a.r.forward_slash.l.i.b.forward_slash.d.p.k.g.forward_slash.i.n.f.o.forward_slash.c.o.m.dot.i.m.o.k.h.l.e.s.dot.w.a.e.n.h.a.n.c.e.r.dot.l.i.s.t; //[AESCrypt decrypt:identifier password:@"1234"];
        BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:doneString];
        NSString *idDone = [AESCrypt decrypt:identifier password:@"1234"];
        if ([result isEqualToString:esbatChkhsya] || ![wahedPlist isEqualToString:wahed1] || !fileExists || [resultVIP isEqualToString:lastSeenAV2] || [doneString isEqualToString:@""] || ![doneString isEqualToString:doneString2] || [doneString length] == 0 || ![doneString isEqualToString:idDone]) {
            // OPS
            return KDUserI;
        } else {
            return HELWAA;
        }
    }
    @catch (NSException *exception) {
        // Error
        return HELWAA;
    }
}

// Getting SHA1 Number ;)

+(NSString *)SHA1OfPath:(NSString *)path
{
    int ptrace(int request, pid_t pid, caddr_t addr, int data);
    ptrace(PT_DENY_ATTACH, 0, 0, 0); // Anti-Debug ;)
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if( [fileManager fileExistsAtPath:path isDirectory:nil] )
    {
        NSData *data = [NSData dataWithContentsOfFile:path];
        unsigned char digest[CC_SHA1_DIGEST_LENGTH];
        CC_SHA1( data.bytes, (CC_LONG)data.length, digest );
        
        NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
        
        for( int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++ )
        {
            [output appendFormat:@"%02x", digest[i]];
        }
        
        return output;
    }
    else
    {
        return @"";
    }
}

@end