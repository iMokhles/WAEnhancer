//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIView.h"

@class CALayer;

__attribute__((visibility("hidden")))
@interface WAPoofAnimationView : UIView
{
    CALayer *_imageLayer;
     _completionHandler;
}

+ (id)poof;

- (void)animationDidStop:(id)arg1 finished:(BOOL)arg2;
- (void)performAnimationWithCompletionHandler:(id)arg1;
- (void)layoutSubviews;
- (id)initWithFrame:(struct CGRect)arg1;

@end

