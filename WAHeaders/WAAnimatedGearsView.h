//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIView.h"

@class UIImageView;

__attribute__((visibility("hidden")))
@interface WAAnimatedGearsView : UIView
{
    BOOL _animating;
    UIImageView *_gearsBase;
    UIImageView *_animatedGears;
    UIImageView *_innerGear;
    UIImageView *_outerGear;
    UIImageView *_outerGearShadow;
}

+ (struct CGSize)baseSize;

- (BOOL)isAnimating;
- (void)stopAnimating;
- (void)startAnimating;
- (void)layoutSubviews;
- (void)setFrame:(struct CGRect)arg1;
- (void)configureForLegacyOS;
- (void)configure;
- (void)awakeFromNib;
- (id)initWithFrame:(struct CGRect)arg1;

@end
