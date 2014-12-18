//
//  WALPActivity.h
//  WallpaperPlus
//
//  Created by iMokhles on 8/25/14.
//  Copyright (c) 2014 iMokhles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface WhatsAppAppDelegate : NSObject
@property(retain, nonatomic) NSString *wallpaperImagePath;
@end


@protocol WAWallpaperPreviewControllerDelegate <NSObject>
- (void)wallpaperPreviewControllerDidCancel:(id)arg1;
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(UIImage *)arg2;
@end

@interface WAWallpaperPreviewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UIView *_bottomView;
    UIScrollView *_pagingScrollView;
    NSMutableArray *_scrollViewPages;
    UIScrollView *_scrollView;
    UIImageView *_imageView;
    UITableView *_tableViewMessages;
    UIButton *_buttonParallaxOnOff;
    UIMotionEffectGroup *_parallaxEffect;
    BOOL _parallaxEnabled;
    NSArray *_messagesLeft;
    NSArray *_messagesMiddle;
    NSArray *_messagesRight;
    NSArray *_messagesSinglePhoto;
    BOOL _libraryMode;
    id <WAWallpaperPreviewControllerDelegate> _delegate;
    int _libraryImageIndex;
    UIImage *_image;
}

+ (id)controllerWithLibraryImageIndex:(unsigned int)arg1;
+ (id)controllerWithImage:(id)arg1;
@property(retain, nonatomic) UIImage *image; // @synthesize image=_image;
@property(nonatomic) int libraryImageIndex; // @synthesize libraryImageIndex=_libraryImageIndex;
@property(nonatomic) BOOL libraryMode; // @synthesize libraryMode=_libraryMode;
@property(nonatomic) id <WAWallpaperPreviewControllerDelegate> delegate; // @synthesize delegate=_delegate;
- (id)tableView:(id)arg1 viewForHeaderInSection:(int)arg2;
- (float)tableView:(id)arg1 heightForHeaderInSection:(int)arg2;
- (int)tableView:(id)arg1 editingStyleForRowAtIndexPath:(id)arg2;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
- (float)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2;
- (float)tableView:(id)arg1 heightForRowWithCellData:(id)arg2;
- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2;
- (int)numberOfSectionsInTableView:(id)arg1;
- (id)sampleChatMessagesForTableView:(id)arg1;
- (void)scrollViewDidScroll:(id)arg1;
- (void)scrollViewDidEndZooming:(id)arg1 withView:(id)arg2 atScale:(float)arg3;
- (void)scrollViewDidEndDecelerating:(id)arg1;
- (void)scrollViewDidEndDragging:(id)arg1 willDecelerate:(BOOL)arg2;
- (void)scrollViewWillBeginZooming:(id)arg1 withView:(id)arg2;
- (void)scrollViewWillBeginDragging:(id)arg1;
- (id)viewForZoomingInScrollView:(id)arg1;
- (void)updateScrollViewAfterEnablingMotion:(BOOL)arg1;
- (void)checkIfMotionShouldBeDisabledUnintentionally;
- (void)updateParallaxOnOffButtonState;
- (void)setParallaxEffectEnabled:(BOOL)arg1;
- (void)parallaxOnOffAction:(id)arg1;
- (void)cancelAction:(id)arg1;
- (void)doneAction:(id)arg1;
- (id)imageForCurrentZoomRect;
- (void)reloadSingleImage;
- (void)tilePages;
- (void)setCurrentPageIndex:(unsigned int)arg1;
- (void)scrollToPageAtIndex:(int)arg1 animated:(BOOL)arg2;
- (void)unloadScrollViewPageAtIndex:(int)arg1;
- (void)loadScrollViewPageAtIndex:(int)arg1 asynchronously:(BOOL)arg2;
- (id)parallaxOnOffButton;
- (id)sampleConversationTable;
- (void)presentFromViewController:(id)arg1 animated:(BOOL)arg2;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1;
- (unsigned int)supportedInterfaceOrientations;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)arg1;
- (void)loadView;
- (id)init;

@end

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)

@interface WallpaperSourceViewController : UITableViewController <WAWallpaperPreviewControllerDelegate>
- (void)navigationController:(id)arg1 willShowViewController:(id)arg2 animated:(BOOL)arg3;
@end

@interface WALPActivity : UIActivity {
    UIImage *sharedImage;
    NSString *imgPath;
    UIImage *resizedImage;
    WAWallpaperPreviewController *wallImageController;
}

@end

@interface WhatsAppWallpaper : NSObject

@property (nonatomic, assign, readonly) unsigned int photoIndex;

- (id)initWithImageIndex:(unsigned int)photoNumber;
@end

