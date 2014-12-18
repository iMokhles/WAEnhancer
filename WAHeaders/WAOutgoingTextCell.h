//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAMessageCell.h"

@class UIImageView;

__attribute__((visibility("hidden")))
@interface WAOutgoingTextCell : WAMessageCell
{
    UIImageView *_bubbleMaskView;
    UIImageView *_overlayImageView;
}

+ (float)heightForCellData:(id)arg1 width:(float)arg2 editing:(BOOL)arg3;
+ (id)cellReuseIdentifier;

- (void)showPopupMenu;
- (BOOL)selectable;
- (void)configureCellUpdatingAllContents:(BOOL)arg1 animated:(BOOL)arg2;
- (id)initWithStyle:(int)arg1 reuseIdentifier:(id)arg2;

@end

