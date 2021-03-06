//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UITableViewCell.h"

@class NSArray, NSBlockOperation, NSMutableArray, NSMutableSet;

__attribute__((visibility("hidden")))
@interface WAThumbsTableViewCell : UITableViewCell
{
    NSMutableArray *_thumbnailViews;
    NSBlockOperation *_thumbnailLoadingOp;
    NSMutableArray *_thumbnails;
    int _loadingID;
    NSMutableSet *_selectedIndexes;
    id <WAThumbsTableViewCellDelegate> _delegate;
    int _thumbnailCount;
}

+ (int)thumbnailCountForRowOfWidth:(float)arg1;
@property(readonly, nonatomic) NSArray *thumbnailViews; // @synthesize thumbnailViews=_thumbnailViews;
@property(readonly, nonatomic) int thumbnailCount; // @synthesize thumbnailCount=_thumbnailCount;
@property(nonatomic) id <WAThumbsTableViewCellDelegate> delegate; // @synthesize delegate=_delegate;

- (void)loadThumbnailsForMessages:(id)arg1 loadingID:(int)arg2 inOperation:(id)arg3;
- (void)cancelThumbnailLoading;
- (void)loadThumbnailsForMessages:(id)arg1 inQueue:(id)arg2;
- (unsigned int)thumbnailStateAtIndex:(unsigned int)arg1;
- (void)setThumbnailState:(unsigned int)arg1 atIndex:(unsigned int)arg2;
- (void)cellTapped:(id)arg1;
- (void)prepareForReuse;
- (void)layoutSubviews;
- (void)refreshSelectionState;
- (void)setSelectedIndexes:(id)arg1;
- (void)setThumbnails:(id)arg1;
- (id)initWithStyle:(int)arg1 reuseIdentifier:(id)arg2;

@end

