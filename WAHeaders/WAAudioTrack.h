//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class AVAssetExportSession, NSString, NSTimer, NSURL, UIImage;

__attribute__((visibility("hidden")))
@interface WAAudioTrack : NSObject
{
     _exportCompletionHandler;
     _exportProgressHandler;
    AVAssetExportSession *_exportSession;
    NSTimer *_progressTimer;
    float _lastProgressValue;
    NSURL *_assetURL;
    UIImage *_artwork;
    NSString *_title;
    NSString *_authorName;
    NSString *_collectionName;
    NSString *_outputFileType;
    NSURL *_outputMediaURLWithoutFileExtension;
    NSURL *_outputMediaURL;
    double _duration;
}

+ (id)audioFileExtensionForFileType:(id)arg1;
+ (id)cachePathForAssetURL:(id)arg1;
+ (void)pruneAudioTrackExportCacheFiles;
+ (id)pathToAudioTrackExportCacheFiles;
+ (BOOL)isMediaItemShareable:(id)arg1 error:(id *)arg2;
@property(readonly, nonatomic) NSURL *outputMediaURL; // @synthesize outputMediaURL=_outputMediaURL;
@property(retain, nonatomic) NSURL *outputMediaURLWithoutFileExtension; // @synthesize outputMediaURLWithoutFileExtension=_outputMediaURLWithoutFileExtension;
@property(readonly, nonatomic) NSString *outputFileType; // @synthesize outputFileType=_outputFileType;
@property(readonly, nonatomic) double duration; // @synthesize duration=_duration;
@property(readonly, nonatomic) NSString *collectionName; // @synthesize collectionName=_collectionName;
@property(readonly, nonatomic) NSString *authorName; // @synthesize authorName=_authorName;
@property(readonly, nonatomic) NSString *title; // @synthesize title=_title;
@property(readonly, nonatomic) UIImage *artwork; // @synthesize artwork=_artwork;
@property(readonly, nonatomic) NSURL *assetURL; // @synthesize assetURL=_assetURL;

- (void)updateProgress:(id)arg1;
- (void)stopProgressTimer;
- (void)startProgressTimer;
- (void)handleExportCompletionWithSuccessfulOutcome:(BOOL)arg1;
- (void)performExport;
- (void)transferToMediaDirectoryWithProgressHandler:(id)arg1 completion:(id)arg2;
- (void)addOutputFileToCache;
- (id)pathOfCachedAudioTrackFileForExport;
- (void)prepareWithCompletionHandler:(id)arg1;
- (id)initWithMediaItem:(id)arg1;

@end

