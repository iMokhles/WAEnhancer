//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAMessageHelper.h"

__attribute__((visibility("hidden")))
@interface WAAudioMessageHelper : WAMessageHelper
{
}

+ (id)mediaBrowserThumbnailForAudioFromContact:(int)arg1 atPath:(id)arg2 fromMe:(BOOL)arg3;
- (id)activitySubjectForActivityType:(id)arg1;
- (id)activityItemForActivityType:(id)arg1;
- (id)activityPlaceholderItem;
- (id)stringRepresentation;
- (struct CGSize)chatThumbnailSize;
- (id)chatThumbnailReturningPermanentState:(char *)arg1;
- (void)internalGenerateMediaBrowserThumbnailFromImageRepresentation:(id)arg1 completion:(id)arg2;

@end

