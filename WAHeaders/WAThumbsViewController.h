//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WATableViewController.h"

#import "WAImageToImageTransitioning.h"
#import "WAMediaGallery.h"
#import "WAThumbsTableViewCellDelegate.h"

@class NSIndexPath, NSMutableArray, NSMutableSet, NSOperationQueue, UIBarButtonItem, UIImageView, UILabel, UIView, WAMediaManager;

__attribute__((visibility("hidden")))
@interface WAThumbsViewController : WATableViewController <WAImageToImageTransitioning, WAThumbsTableViewCellDelegate, WAMediaGallery>
{
    UIView *_mediaCountView;
    UILabel *_mediaCountLabel;
    UIView *_noMediaView;
    UIImageView *_noMediaImageView;
    UILabel *_noMediaTitleLabel;
    UILabel *_noMediaTextLabel;
    UIBarButtonItem *_editBarButton;
    UIBarButtonItem *_cancelBarButton;
    UIBarButtonItem *_deleteBarButton;
    UIBarButtonItem *_shareItemsBarButton;
    UIBarButtonItem *_doneBarButton;
    BOOL _editing;
    NSMutableSet *_selectedIndexPaths;
    NSOperationQueue *_thumbnailLoadingOpQueue;
    int _thumbnailCountPerRow;
    BOOL _needsAutoScroll;
    BOOL _isPerformingFancyRotation;
    UIImageView *_beforeRotationSnapshotImageView;
    UIImageView *_afterRotationSnapshotImageView;
    UIView *_whiteBackgroundView;
    NSIndexPath *_thumbnailIndexPathToRestore;
    struct CGPoint _contentOffsetAtStartOfRotation;
    UIView *_transitionAnimationSourceView;
    NSIndexPath *_messageIndexPathForTransitionAnimation;
    NSMutableArray *_selectedMessagesBeforeMediaManagerContentChange;
    BOOL _mediaManagerUpdateInProgress;
    WAMediaManager *_mediaManager;
    id <WAMediaGalleryControllerDelegate> _delegate;
    NSIndexPath *_indexPathOfMessageToScrollToWhenAppearing;
}

@property(retain, nonatomic) NSIndexPath *indexPathOfMessageToScrollToWhenAppearing; // @synthesize indexPathOfMessageToScrollToWhenAppearing=_indexPathOfMessageToScrollToWhenAppearing;
@property(nonatomic) id <WAMediaGalleryControllerDelegate> delegate; // @synthesize delegate=_delegate;
@property(retain, nonatomic) WAMediaManager *mediaManager; // @synthesize mediaManager=_mediaManager;

- (void)handleInteractiveDismissGesture:(id)arg1;
- (void)finishTransitionWithView:(id)arg1 context:(id)arg2;
- (id)viewForTransitionAnimationWithContext:(id)arg1;
- (void)prepareForTransitionWithContext:(id)arg1;
- (BOOL)shouldUseImageToImageTransitionForOperation:(int)arg1 fromViewController:(id)arg2 toViewController:(id)arg3 context:(id)arg4;
- (void)forwardMediaItems:(id)arg1 toContact:(id)arg2;
- (void)shareSelectedItems:(id)arg1;
- (void)didRotateFromInterfaceOrientation:(int)arg1;
- (void)willAnimateRotationToInterfaceOrientation:(int)arg1 duration:(double)arg2;
- (void)willRotateToInterfaceOrientation:(int)arg1 duration:(double)arg2;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (unsigned int)supportedInterfaceOrientations;
- (void)scrollToThumbnailAtIndexPath:(id)arg1 animated:(BOOL)arg2;
- (id)indexPathOfThumbnailAtCenterOfView;
- (id)tableViewSnapshot;
- (void)tableViewCell:(id)arg1 tappedImageAtIndex:(int)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (id)tableView:(id)arg1 titleForHeaderInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (id)tableView:(id)arg1 viewForFooterInSection:(int)arg2;
- (float)tableView:(id)arg1 heightForFooterInSection:(int)arg2;
- (void)updateFooter;
- (void)scrollAutomaticallyToRelevantItem;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)exit:(id)arg1;
- (void)deleteAction:(id)arg1;
- (void)cancelAction:(id)arg1;
- (void)editAction:(id)arg1;
- (void)mediaManagerDidChangeContent:(id)arg1;
- (void)mediaManagerWillChangeContent:(id)arg1;
- (void)presentMediaAtIndexPath:(id)arg1;
- (void)deleteSelectedMedia;
- (void)updateEditingWithAnimation:(BOOL)arg1;
- (void)updateSelection;
- (void)updateLayoutToOrientation:(int)arg1;
- (void)relayoutNoMediaViews;
- (id)uniqueIdentifier;
- (void)dealloc;
- (id)initWithStyle:(int)arg1;
- (id)init;

@end
