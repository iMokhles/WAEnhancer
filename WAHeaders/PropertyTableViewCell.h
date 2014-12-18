//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UITableViewCell.h"

@class NSTimer, UIImageView, UILabel;

__attribute__((visibility("hidden")))
@interface PropertyTableViewCell : UITableViewCell
{
    UILabel *_labelLabel;
    UILabel *_labelValue;
    UILabel *_labelComment;
    UIImageView *_imageViewStar;
    BOOL _isFavorite;
    BOOL _valueHighlighted;
    BOOL _popupActive;
    NSTimer *_popupTimer;
}

+ (float)heightForText:(id)arg1 withFont:(id)arg2 hasComment:(BOOL)arg3 hasStar:(BOOL)arg4 cellWidth:(float)arg5;
+ (id)commentFont;
+ (id)valueFont;
+ (id)labelFont;
+ (id)commentTextColorSelected;
+ (id)commentTextColorNormal;
+ (id)valueTextColorHighlighted;
+ (id)valueTextColorSelected;
+ (id)valueTextColorNormal;
+ (id)labelTextColorSelected;
+ (id)labelTextColorNormal;
@property(nonatomic) BOOL valueHighlighted; // @synthesize valueHighlighted=_valueHighlighted;
@property(readonly, nonatomic) BOOL popupActive; // @synthesize popupActive=_popupActive;
@property(readonly, nonatomic) UILabel *labelComment; // @synthesize labelComment=_labelComment;
@property(readonly, nonatomic) UILabel *labelValue; // @synthesize labelValue=_labelValue;
@property(readonly, nonatomic) UILabel *labelLabel; // @synthesize labelLabel=_labelLabel;

@property(nonatomic) BOOL isFavorite;
- (void)didHideMenu;
- (void)showCopyPasteView:(id)arg1;
- (void)copy:(id)arg1;
- (BOOL)canPerformAction:(SEL)arg1 withSender:(id)arg2;
- (BOOL)canBecomeFirstResponder;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (void)setHighlighted:(BOOL)arg1 animated:(BOOL)arg2;
- (void)setSelected:(BOOL)arg1 animated:(BOOL)arg2;
- (void)layoutSubviews;
- (id)initWithStyle:(int)arg1 reuseIdentifier:(id)arg2;

@end

