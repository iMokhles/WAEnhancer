//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIView.h"

@class NSMutableArray, UIButton, WAMultiSendEditButton;

__attribute__((visibility("hidden")))
@interface WAMultiSendEditButtonPresenterView : UIView
{
    WAMultiSendEditButton *_editButton;
    NSMutableArray *_buttons;
    float _expandedStateHorizontalTranslation;
    BOOL _suppressButtonLayout;
    BOOL _buttonsHidden;
    float _imageEdge;
    id <WAMultiSendEditButtonPresenterViewDelegate> _delegate;
}

@property(nonatomic) id <WAMultiSendEditButtonPresenterViewDelegate> delegate; // @synthesize delegate=_delegate;
@property(readonly, nonatomic) UIButton *editButton; // @synthesize editButton=_editButton;
@property(nonatomic) BOOL buttonsHidden; // @synthesize buttonsHidden=_buttonsHidden;
@property(nonatomic) float imageEdge; // @synthesize imageEdge=_imageEdge;

- (void)setButtonsExpandedCount:(int)arg1;
- (void)setButtonsExpanded:(BOOL)arg1;
- (void)collapseButtonsTo:(int)arg1;
- (void)expandButtonsTo:(int)arg1;
- (void)setButtonsHidden:(BOOL)arg1 animated:(BOOL)arg2;
- (void)toggleButtons:(id)arg1;
- (void)resize;
- (float)totalWidthOfButtons;
- (void)addButton:(id)arg1;
- (void)layoutSubviews;
- (id)doppelganger;
- (id)hitTest:(struct CGPoint)arg1 withEvent:(id)arg2;
- (id)initWithFrame:(struct CGRect)arg1;

@end

