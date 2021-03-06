//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WALargeMediaMessageCell.h"

@class CALayer, UIImageView, UIView, WAAutoCropImageView;

__attribute__((visibility("hidden")))
@interface WALargeVideoMessageCell : WALargeMediaMessageCell
{
    UIView *_playButtonView;
    WAAutoCropImageView *_blurBackgroundView;
    CALayer *_blurMaskLayer;
    UIImageView *_circleImageView;
}

+ (id)cellReuseIdentifier;
+ (float)maximumParallaxOffset;
+ (float)maximumImageWidth;

- (void)blurredImageDidBecomeAvailable:(id)arg1;
- (void)setProgressViewHidden:(BOOL)arg1 animated:(BOOL)arg2;
- (void)prepareForReuse;
- (void)layoutSubviews;
- (id)initWithStyle:(int)arg1 reuseIdentifier:(id)arg2;

@end

