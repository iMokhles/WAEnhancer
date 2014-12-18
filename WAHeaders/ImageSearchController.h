//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAViewController.h"

#import "UISearchBarDelegate.h"

@class ImageListScrollView, NSMutableArray, NSString, UIActivityIndicatorView, UIButton, UIImageView, UILabel, UISearchBar, UIView;

__attribute__((visibility("hidden")))
@interface ImageSearchController : WAViewController <UISearchBarDelegate>
{
    UIActivityIndicatorView *_activityIndicator;
    UILabel *_labelNoResults;
    UIButton *_buttonLoadMore;
    UIView *_overlayView;
    NSMutableArray *_imageURLs;
    NSMutableArray *_thumbnailViews;
    UIImageView *_highlightedImageView;
    int _searchOffset;
    int _resultsCount;
    UISearchBar *_searchBar;
    ImageListScrollView *_scrollView;
    NSString *_preloadedSearchText;
    id <ImageSearchControllerDelegate> _delegate;
}

@property(nonatomic) id <ImageSearchControllerDelegate> delegate; // @synthesize delegate=_delegate;
@property(retain, nonatomic) NSString *preloadedSearchText; // @synthesize preloadedSearchText=_preloadedSearchText;
@property(retain, nonatomic) ImageListScrollView *scrollView; // @synthesize scrollView=_scrollView;
@property(retain, nonatomic) UISearchBar *searchBar; // @synthesize searchBar=_searchBar;

- (void)fetcher:(id)arg1 finishedWithData:(id)arg2 error:(id)arg3;
- (void)searchBarTextDidEndEditing:(id)arg1;
- (void)searchBarTextDidBeginEditing:(id)arg1;
- (void)searchBar:(id)arg1 textDidChange:(id)arg2;
- (void)searchBarCancelButtonClicked:(id)arg1;
- (void)searchBarSearchButtonClicked:(id)arg1;
- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)touchesEnded:(id)arg1 withEvent:(id)arg2;
- (void)touchesMoved:(id)arg1 withEvent:(id)arg2;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (void)willAnimateRotationToInterfaceOrientation:(int)arg1 duration:(double)arg2;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)cancelAction:(id)arg1;
- (void)clearAction:(id)arg1;
- (void)loadMoreAction:(id)arg1;
- (void)updateLayoutForCurrentOrientation;
- (int)positionForBar:(id)arg1;
- (void)addSearchResults:(id)arg1;
- (void)selectMediaAtIndex:(id)arg1;
- (void)doSearch:(id)arg1;
- (void)resetSearchResults;
- (void)showActivity:(BOOL)arg1;
- (void)hideOverlay;
- (void)showOverlay;
- (id)initWithDelegate:(id)arg1;

@end
