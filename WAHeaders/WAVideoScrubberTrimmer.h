//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAVideoScrubberPrecisionRangeSlider.h"

#import "UIGestureRecognizerDelegate.h"

@class UIImageView, UIView;

__attribute__((visibility("hidden")))
@interface WAVideoScrubberTrimmer : WAVideoScrubberPrecisionRangeSlider <UIGestureRecognizerDelegate>
{
    UIImageView *_leftHandleView;
    UIImageView *_rightHandleView;
    UIImageView *_middleFillView;
    UIView *_coverContainerView;
    UIView *_leftCover;
    UIView *_rightCover;
    UIImageView *_scrubberThumb;
    float _thumbValueBeforeDragging;
    float _thumbValue;
}

+ (float)preferredHeight;
@property(nonatomic) float thumbValue; // @synthesize thumbValue=_thumbValue;

- (void)handleThumbPan:(id)arg1;
- (void)didEndDragging;
- (void)didBeginDragging;
- (BOOL)shouldBeginDraggingWithTouch:(id)arg1;
- (BOOL)gestureRecognizerShouldBegin:(id)arg1;
- (id)rightHandleView;
- (id)leftHandleView;
- (void)didChangeRange;
@property(readonly, nonatomic) struct CGRect frameForThumbnailBar;
- (float)minimumRangeWidth;
- (void)setThumbHidden:(BOOL)arg1 animated:(BOOL)arg2;
- (void)layoutSubviews;
- (void)getFramesForLeftHandle:(struct CGRect *)arg1 atPosition:(float)arg2 rightHandle:(struct CGRect *)arg3 atPosition:(float)arg4 leftMostVisiblePosition:(float)arg5 rightMostVisiblePosition:(float)arg6;
- (id)initWithFrame:(struct CGRect)arg1;

// Remaining properties
@property(nonatomic) id <WAVideoScrubberTrimmerDelegate> delegate;

@end

