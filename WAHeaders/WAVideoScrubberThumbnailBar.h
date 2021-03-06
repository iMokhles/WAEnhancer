//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIView.h"

@class NSMutableArray, NSMutableDictionary;

__attribute__((visibility("hidden")))
@interface WAVideoScrubberThumbnailBar : UIView
{
    float _thumbnailAspectRatio;
    struct CGSize _thumbnailSize;
    struct CGRect _previousBounds;
    NSMutableArray *_visibleThumbnailViews;
    NSMutableArray *_transitionThumbnailViews;
    CDStruct_e83c9415 _expandedTimeRange;
    int _pivotIndex;
    long _taskID;
    NSMutableDictionary *_thumbnailCache;
    CDStruct_e83c9415 _preparedTimeRange;
    struct dispatch_group_s *_animationDispatchGroup;
    id <WAVideoScrubberThumbnailBarDataSource> _dataSource;
    CDStruct_1b6d18a9 _videoDuration;
}

@property(readonly, nonatomic) CDStruct_1b6d18a9 videoDuration; // @synthesize videoDuration=_videoDuration;
@property(nonatomic) id <WAVideoScrubberThumbnailBarDataSource> dataSource; // @synthesize dataSource=_dataSource;

- (id)bestCachedImageAtTime:(CDStruct_1b6d18a9)arg1;
- (void)addImageToCache:(id)arg1 atTime:(CDStruct_1b6d18a9)arg2;
- (id)cachedImageAtTime:(CDStruct_1b6d18a9)arg1;
- (id)cacheKeyFromTime:(CDStruct_1b6d18a9)arg1;
- (void)revertTimeRangeWithAnimationDuration:(double)arg1;
- (void)expandToTimeRange:(CDStruct_e83c9415)arg1 animationDuration:(double)arg2 aroundTime:(CDStruct_1b6d18a9)arg3;
- (void)prepareThumbnailsForTimeRange:(CDStruct_e83c9415)arg1;
- (void)generateThumbnailsInViews:(id)arg1 timeRange:(CDStruct_e83c9415)arg2 useCache:(BOOL)arg3;
- (void)regenerateThumbnails;
- (void)layoutSubviews;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)arg1;
- (id)initWithVideoDuration:(CDStruct_1b6d18a9)arg1 thumbnailAspectRatio:(struct CGSize)arg2;

@end

