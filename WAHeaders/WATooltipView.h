//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIView.h"

@class NSString, UIButton, UIFont;

__attribute__((visibility("hidden")))
@interface WATooltipView : UIView
{
    float _leftRightPadding;
    float _topBottomPadding;
    UIButton *_buttonClose;
    NSString *_text;
    UIFont *_font;
    BOOL _arrowDown;
    struct CGRect _toolTipRect;
    float _arrowOffset;
    BOOL _fadingIn;
    BOOL _fadingOut;
    BOOL _buttonFired;
}

@property(retain, nonatomic) UIFont *font; // @synthesize font=_font;
@property(retain, nonatomic) NSString *text; // @synthesize text=_text;

- (void)deviceOrientationDidChange:(id)arg1;
- (void)setTooltipVisible:(BOOL)arg1 animated:(BOOL)arg2;
- (void)setTargetRect:(struct CGRect)arg1 inView:(id)arg2;
- (id)hitTest:(struct CGPoint)arg1 withEvent:(id)arg2;
- (void)layoutSubviews;
- (void)drawRectiOS6:(struct CGRect)arg1;
- (void)drawTextWithDelta:(struct CGPoint)arg1;
- (void)drawRectiOS7:(struct CGRect)arg1;
- (struct CGRect)mainBubbleRect7;
- (void)drawRect:(struct CGRect)arg1;
- (void)fireButton:(id)arg1;
- (id)siblingView;
- (void)closeAction:(id)arg1;
- (void)dismissTooltip;
- (void)updateOrientation;
- (void)adjustSizeToContent;
- (void)dealloc;
- (id)init;

@end

