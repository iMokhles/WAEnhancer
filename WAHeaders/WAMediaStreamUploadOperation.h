//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAMediaUploadOperationBase.h"

#import "NSStreamDelegate.h"
#import "NSURLConnectionDelegate.h"

@class NSData, NSInputStream, NSMutableData, NSOutputStream, NSString, NSURLConnection;

__attribute__((visibility("hidden")))
@interface WAMediaStreamUploadOperation : WAMediaUploadOperationBase <NSStreamDelegate, NSURLConnectionDelegate>
{
    NSString *_fileName;
    BOOL _isExecuting;
    BOOL _isFinished;
    NSString *_uploadURL;
    NSMutableData *_receiveData;
    BOOL _mediaComplete;
    int _uploadPhase;
    int _waitCount;
    NSString *_streamingHash;
    NSURLConnection *_urlConnection;
    NSData *_bodyPrefixData;
    NSData *_bodyFileData;
    NSData *_bodySuffixData;
    NSOutputStream *_producerStream;
    NSInputStream *_consumerStream;
    const char *_currentBuffer;
    unsigned int _bufferOffset;
    unsigned int _bufferLimit;
    unsigned int _fileOffset;
    NSString *_mediaLocalPath;
}

@property(retain, nonatomic) NSString *mediaLocalPath; // @synthesize mediaLocalPath=_mediaLocalPath;
@property(nonatomic) unsigned int fileOffset; // @synthesize fileOffset=_fileOffset;
@property(nonatomic) unsigned int bufferLimit; // @synthesize bufferLimit=_bufferLimit;
@property(nonatomic) unsigned int bufferOffset; // @synthesize bufferOffset=_bufferOffset;
@property(nonatomic) const char *currentBuffer; // @synthesize currentBuffer=_currentBuffer;
@property(retain, nonatomic) NSInputStream *consumerStream; // @synthesize consumerStream=_consumerStream;
@property(retain, nonatomic) NSOutputStream *producerStream; // @synthesize producerStream=_producerStream;
@property(retain, nonatomic) NSData *bodySuffixData; // @synthesize bodySuffixData=_bodySuffixData;
@property(retain, nonatomic) NSData *bodyFileData; // @synthesize bodyFileData=_bodyFileData;
@property(retain, nonatomic) NSData *bodyPrefixData; // @synthesize bodyPrefixData=_bodyPrefixData;
@property(retain, nonatomic) NSURLConnection *urlConnection; // @synthesize urlConnection=_urlConnection;
@property(retain, nonatomic) NSString *streamingHash; // @synthesize streamingHash=_streamingHash;

- (void)stream:(id)arg1 handleEvent:(unsigned int)arg2;
- (void)processNextUploadChunk;
- (void)uploadRequestDidFailWithError:(id)arg1 userInfo:(id)arg2;
- (void)uploadRequestSucceeded:(id)arg1 userInfo:(id)arg2;
- (void)connectionDidFinishLoading:(id)arg1;
- (void)connection:(id)arg1 didFailWithError:(id)arg2;
- (void)connection:(id)arg1 didReceiveData:(id)arg2;
- (void)connection:(id)arg1 didSendBodyData:(int)arg2 totalBytesWritten:(int)arg3 totalBytesExpectedToWrite:(int)arg4;
- (void)connection:(id)arg1 didReceiveResponse:(id)arg2;
- (id)connection:(id)arg1 willSendRequest:(id)arg2 redirectResponse:(id)arg3;
- (id)uploadError;
- (BOOL)shouldProceed;
- (BOOL)isFinished;
- (BOOL)isExecuting;
- (void)finish;
- (void)startHTTPUpload;
- (void)start;
- (void)dealloc;
- (void)assignMessage:(id)arg1 delegate:(id)arg2;
- (id)initWithMediaLocalPath:(id)arg1 connection:(id)arg2;

@end

