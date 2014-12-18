//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIImageView.h"

@class UIButton;

__attribute__((visibility("hidden")))
@interface WAWallpaperImageView : UIImageView
{
    UIButton *_button;
    id <WAWallpaperImageViewDelegate> _delegate;
    unsigned int _wallpaperLibraryImageIndex;
}

@property(readonly, nonatomic) unsigned int wallpaperLibraryImageIndex; // @synthesize wallpaperLibraryImageIndex=_wallpaperLibraryImageIndex;
@property(nonatomic) id <WAWallpaperImageViewDelegate> delegate; // @synthesize delegate=_delegate;

- (void)loadThumbnailIfNeededAsynchronously;
- (void)imageTapped:(id)arg1;
- (void)layoutSubviews;
- (id)initWithWallpaperLibraryImageIndex:(unsigned int)arg1;

@end
