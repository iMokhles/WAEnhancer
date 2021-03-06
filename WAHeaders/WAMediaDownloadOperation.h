//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSOperation.h"

#import "NSURLConnectionDelegate.h"

@class NSDate, NSHTTPURLResponse, NSMutableData, NSMutableDictionary, NSString, NSURLConnection, WAMessage, XMPPConnection;

__attribute__((visibility("hidden")))
@interface WAMediaDownloadOperation : NSOperation <NSURLConnectionDelegate>
{
    XMPPConnection *_connection;
    id <WAMediaDownloadOperationDelegate> _delegate;
    NSDate *_startDate;
    NSURLConnection *_urlConnection;
    unsigned int _expectedContentLength;
    NSHTTPURLResponse *_response;
    NSMutableDictionary *_avParams;
    NSMutableData *_receiveData;
    NSMutableData *_partialFileData;
    BOOL _partialDownload;
    BOOL _isExecuting;
    BOOL _isFinished;
    BOOL _autodownload;
    WAMessage *_message;
    NSString *_fileName;
}

@property(readonly, nonatomic) BOOL autodownload; // @synthesize autodownload=_autodownload;
@property(readonly, nonatomic) NSString *fileName; // @synthesize fileName=_fileName;
@property(readonly, nonatomic) WAMessage *message; // @synthesize message=_message;

- (void)connectionDidFinishLoading:(id)arg1;
- (void)connection:(id)arg1 didFailWithError:(id)arg2;
- (void)connection:(id)arg1 didReceiveData:(id)arg2;
- (void)connection:(id)arg1 didReceiveResponse:(id)arg2;
- (id)connection:(id)arg1 willSendRequest:(id)arg2 redirectResponse:(id)arg3;
- (void)performFinalDataCheck;
- (void)startUrlConnection;
- (id)partialUploadFilePath;
- (BOOL)isFinished;
- (BOOL)isExecuting;
- (void)savePartialData;
- (void)cancel;
- (void)finish;
- (void)start;
- (void)dealloc;
- (id)initWithDownloadOperationDelegate:(id)arg1 connection:(id)arg2 message:(id)arg3 autodownload:(BOOL)arg4;

@end

