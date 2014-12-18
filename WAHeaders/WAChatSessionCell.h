//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UITableViewCell.h"

@class NSString, UIButton, UIFont, UIImage, UIImageView, UILabel, UIView, _WAChatSessionCellEditOptionsView;

__attribute__((visibility("hidden")))
@interface WAChatSessionCell : UITableViewCell
{
    UILabel *_unreadLabel;
    UIView *_viewUnread;
    UILabel *_messageLabel;
    UILabel *_activityLabel;
    UIImageView *_muteIndicator;
    UIImageView *_locationIcon;
    UIImageView *_pushToTalkIcon;
    UIImageView *_imageViewContactPicture;
    UIView *_sideSwipeTouchView;
    _WAChatSessionCellEditOptionsView *_editOptionsView;
    UIButton *_deleteButton;
    BOOL _removeAllDeleteConfirmationViewsOnReuse;
    BOOL _showLocationIcon;
    BOOL _muted;
    BOOL _showMoreButton;
    NSString *_jid;
    UILabel *_nameLabel;
    UILabel *_senderLabel;
    UILabel *_timeLabel;
    int _unreadCount;
    unsigned int _pushToTalkIconType;
    unsigned int _chatActivity;
    id <WAChatSessionCellDelegate> _delegate;
}

@property(nonatomic) id <WAChatSessionCellDelegate> delegate; // @synthesize delegate=_delegate;
@property(nonatomic) BOOL showMoreButton; // @synthesize showMoreButton=_showMoreButton;
@property(nonatomic) unsigned int chatActivity; // @synthesize chatActivity=_chatActivity;
@property(nonatomic) BOOL muted; // @synthesize muted=_muted;
@property(nonatomic) unsigned int pushToTalkIconType; // @synthesize pushToTalkIconType=_pushToTalkIconType;
@property(nonatomic) BOOL showLocationIcon; // @synthesize showLocationIcon=_showLocationIcon;
@property(nonatomic) int unreadCount; // @synthesize unreadCount=_unreadCount;
@property(readonly, nonatomic) UILabel *timeLabel; // @synthesize timeLabel=_timeLabel;
@property(readonly, nonatomic) UILabel *senderLabel; // @synthesize senderLabel=_senderLabel;
@property(readonly, nonatomic) UILabel *nameLabel; // @synthesize nameLabel=_nameLabel;
@property(retain, nonatomic) NSString *jid; // @synthesize jid=_jid;

- (id)accessibilityLabel;
- (BOOL)isAccessibilityElement;
- (BOOL)gestureRecognizer:(id)arg1 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)arg2;
- (void)handleSideSwipe:(id)arg1;
- (void)setChatActivity:(unsigned int)arg1 animated:(BOOL)arg2;
@property(retain, nonatomic) UIFont *messageFont;
@property(copy, nonatomic) NSString *messageText;
@property(retain, nonatomic) UIImage *contactImage;
- (void)didTransitionToState:(unsigned int)arg1;
- (void)willTransitionToState:(unsigned int)arg1;
- (void)setHighlighted:(BOOL)arg1 animated:(BOOL)arg2;
- (void)setSelected:(BOOL)arg1 animated:(BOOL)arg2;
- (void)layoutSubviews;
- (void)showMoreOptions:(id)arg1;
- (void)swipeToDelete:(id)arg1;
- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4;
- (id)privateScrollView;
- (void)prepareForReuse;
- (void)dealloc;
- (id)initWithStyle:(int)arg1 reuseIdentifier:(id)arg2;

@end
