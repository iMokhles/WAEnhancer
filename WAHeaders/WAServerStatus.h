//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSMutableData, NSURLConnection;

__attribute__((visibility("hidden")))
@interface WAServerStatus : NSObject
{
    NSURLConnection *_connection;
    NSMutableData *_data;
     _completitionBlock;
    BOOL _email;
    BOOL _last;
    BOOL _sync;
    BOOL _chat;
    BOOL _group;
    BOOL _multimedia;
    BOOL _online;
    BOOL _profile;
    BOOL _push;
    BOOL _registration;
    BOOL _status;
    BOOL _broadcast;
    BOOL _version;
}

@property(nonatomic) BOOL version; // @synthesize version=_version;
@property(nonatomic) BOOL broadcast; // @synthesize broadcast=_broadcast;
@property(nonatomic) BOOL status; // @synthesize status=_status;
@property(nonatomic) BOOL registration; // @synthesize registration=_registration;
@property(nonatomic) BOOL push; // @synthesize push=_push;
@property(nonatomic) BOOL profile; // @synthesize profile=_profile;
@property(nonatomic) BOOL online; // @synthesize online=_online;
@property(nonatomic) BOOL multimedia; // @synthesize multimedia=_multimedia;
@property(nonatomic) BOOL group; // @synthesize group=_group;
@property(nonatomic) BOOL chat; // @synthesize chat=_chat;
@property(nonatomic) BOOL sync; // @synthesize sync=_sync;
@property(nonatomic) BOOL last; // @synthesize last=_last;
@property(nonatomic) BOOL email; // @synthesize email=_email;

- (void)connection:(id)arg1 didFailWithError:(id)arg2;
- (void)connectionDidFinishLoading:(id)arg1;
- (void)connection:(id)arg1 didReceiveData:(id)arg2;
- (void)connection:(id)arg1 didReceiveResponse:(id)arg2;
- (void)requestStatusWithCompletitionBlock:(id)arg1;
- (id)init;

@end
