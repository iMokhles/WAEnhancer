//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WABubbleView.h"

@class UIActivityIndicatorView, UIImage, UIImageView, UIView, WAGradientView;

__attribute__((visibility("hidden")))
@interface WAMediaBubbleView : WABubbleView
{
    UIView *_containerView;
    UIActivityIndicatorView *_activityIndicator;
    UIImageView *_thumbnailImageView;
    UIView *_thumbnailDimmerView;
    WAGradientView *_gradientView;
    BOOL _timestampOnTop;
    UIImage *_thumbnailImage;
    struct CGSize _imageSize;
}

+ (struct CGSize)sizeForImageOfSize:(struct CGSize)arg1 maxWidth:(float)arg2 fromName:(id)arg3 pushName:(id)arg4 timestampString:(id)arg5 messageStatus:(unsigned int)arg6 showListIcon:(BOOL)arg7 isIncoming:(BOOL)arg8;
+ (float)heightForName:(id)arg1;
@property(nonatomic) BOOL timestampOnTop; // @synthesize timestampOnTop=_timestampOnTop;
@property(retain, nonatomic) UIImage *thumbnailImage; // @synthesize thumbnailImage=_thumbnailImage;
@property(nonatomic) struct CGSize imageSize; // @synthesize imageSize=_imageSize;

- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (void)layoutSubviews;
- (void)drawRect:(struct CGRect)arg1;
- (void)setDimmed:(BOOL)arg1 animated:(BOOL)arg2;
- (void)setHighlighted:(BOOL)arg1 animated:(BOOL)arg2;
@property(nonatomic, getter=isAnimating) BOOL animating;
- (void)useGradientBackground:(BOOL)arg1;
- (id)initWithIncomingState:(BOOL)arg1 delegate:(id)arg2;

@end

