//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WABubbleView.h"

#import "UIGestureRecognizerDelegate.h"

@class NSString, UIActivityIndicatorView, UIImage, UIImageView, UILongPressGestureRecognizer, UITapGestureRecognizer, UIView, WAGradientView;

__attribute__((visibility("hidden")))
@interface WALocationBubbleView : WABubbleView <UIGestureRecognizerDelegate>
{
    UIActivityIndicatorView *_activityIndicator;
    UIView *_containerView;
    UIImageView *_thumbnailImageView;
    UIView *_thumbnailDimmerView;
    WAGradientView *_gradientView;
    struct CGRect _urlRect;
    BOOL _urlHighlighted;
    UITapGestureRecognizer *_tapGestureRecognizer;
    UILongPressGestureRecognizer *_longPressGestureRecognizer;
    UIImage *_thumbnailImage;
    NSString *_placeName;
    NSString *_placeAddress;
    NSString *_placeURL;
    struct CGSize _imageSize;
    CDStruct_2c43369c _locationCoordinate;
}

+ (struct CGSize)sizeForPlaceName:(id)arg1 address:(id)arg2 maxWidth:(float)arg3 timestampString:(id)arg4 messageStatus:(unsigned int)arg5 fromName:(id)arg6 pushName:(id)arg7 imageSize:(struct CGSize)arg8 showListIcon:(BOOL)arg9 isIncoming:(BOOL)arg10;
+ (float)heightForName:(id)arg1 placeName:(id)arg2 placeAddress:(id)arg3;
@property(retain, nonatomic) NSString *placeURL; // @synthesize placeURL=_placeURL;
@property(retain, nonatomic) NSString *placeAddress; // @synthesize placeAddress=_placeAddress;
@property(retain, nonatomic) NSString *placeName; // @synthesize placeName=_placeName;
@property(nonatomic) CDStruct_c3b9c2ee locationCoordinate; // @synthesize locationCoordinate=_locationCoordinate;
@property(retain, nonatomic) UIImage *thumbnailImage; // @synthesize thumbnailImage=_thumbnailImage;
@property(nonatomic) struct CGSize imageSize; // @synthesize imageSize=_imageSize;

- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (void)handleLongPressGesture:(id)arg1;
- (void)handleTapGesture:(id)arg1;
- (BOOL)gestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (void)layoutSubviews;
- (void)drawRect:(struct CGRect)arg1;
- (void)openURL;
- (void)showActionSheet;
- (void)unhighlightURL;
- (void)highlightURL;
- (void)setDimmed:(BOOL)arg1 animated:(BOOL)arg2;
- (void)setHighlighted:(BOOL)arg1 animated:(BOOL)arg2;
@property(nonatomic, getter=isAnimating) BOOL animating;
- (id)initWithIncomingState:(BOOL)arg1 delegate:(id)arg2;

@end

