//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "WAViewController.h"

@class UILabel, UISlider;

__attribute__((visibility("hidden")))
@interface WADebugMediaViewController : WAViewController
{
    BOOL _reloadChatsOnDisappear;
    UISlider *_cropInsetSlider;
    UILabel *_cropInsetLabel;
}

@property(retain, nonatomic) UILabel *cropInsetLabel; // @synthesize cropInsetLabel=_cropInsetLabel;
@property(retain, nonatomic) UISlider *cropInsetSlider; // @synthesize cropInsetSlider=_cropInsetSlider;

- (void)cropInsetChanged:(id)arg1;
- (void)viewDidDisappear:(BOOL)arg1;
- (void)viewDidLoad;
- (id)initWithNibName:(id)arg1 bundle:(id)arg2;

@end

