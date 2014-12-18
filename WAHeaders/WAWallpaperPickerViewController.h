//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAViewController.h"

#import "WAWallpaperImageViewDelegate.h"

@class NSArray, UIImageView, UILabel, UIScrollView, UIView;

__attribute__((visibility("hidden")))
@interface WAWallpaperPickerViewController : WAViewController <WAWallpaperImageViewDelegate>
{
    UIScrollView *_scrollView;
    NSArray *_imageViews;
    UILabel *_footerLabel;
    UIImageView *_beforeRotationSnapshotImageView;
    UIImageView *_afterRotationSnapshotImageView;
    UIView *_whiteBackgroundView;
    struct CGPoint _contentOffsetAtStartOfRotation;
}


- (void)didRotateFromInterfaceOrientation:(int)arg1;
- (void)willAnimateRotationToInterfaceOrientation:(int)arg1 duration:(double)arg2;
- (void)willRotateToInterfaceOrientation:(int)arg1 duration:(double)arg2;
- (id)snapshot;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (unsigned int)supportedInterfaceOrientations;
- (void)selectImage:(id)arg1;
- (void)userDidSelectWallpaperImageView:(id)arg1;
- (void)loadAllImages;
- (void)layoutAllImages;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLoad;
- (void)loadView;
- (id)initWithNibName:(id)arg1 bundle:(id)arg2;

@end
