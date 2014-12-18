//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSArray;

__attribute__((visibility("hidden")))
@interface WAMediaPickerLibraryController : NSObject
{
    struct dispatch_group_s *_loadingDispatchGroup;
    BOOL _assetsLibraryLoadingInProgress;
    NSArray *_albumControllers;
    BOOL _reloadLibraryAfterEnteringForeground;
    BOOL _containsAssets;
    unsigned int _mediaType;
}

+ (void)applicationDidReceiveMemoryWarning:(id)arg1;
+ (void)applicationDidEnterBackground:(id)arg1;
+ (void)applicationWillEnterForeground:(id)arg1;
+ (id)cachedLibraryController;
+ (void)makeCachedLibraryControllerAvailableForDuration:(double)arg1;
+ (void)initialize;
@property(readonly, nonatomic) unsigned int mediaType; // @synthesize mediaType=_mediaType;
@property(readonly, nonatomic) BOOL containsAssets; // @synthesize containsAssets=_containsAssets;
@property(readonly, nonatomic) NSArray *albumControllers; // @synthesize albumControllers=_albumControllers;

- (id)albumControllerForAssetsGroup:(id)arg1 fromArrayOfAlbums:(id)arg2;
- (id)sortAssetsGroups:(id)arg1;
- (void)reloadAssetsLibraryWithCompletionHandler:(id)arg1;
- (void)prepareWithCompletionHandler:(id)arg1;
- (BOOL)isLibraryReady;
- (void)deferredInvalidateAndReload;
- (void)invalidateAndReload;
- (void)assetsLibraryChanged:(id)arg1;
- (void)applicationWillEnterForeground:(id)arg1;
- (void)dealloc;
- (id)initWithMediaType:(unsigned int)arg1;

@end

