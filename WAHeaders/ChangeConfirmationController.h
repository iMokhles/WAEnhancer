//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <UIKit/UIKit.h>

@class UIImageView, UILabel;

__attribute__((visibility("hidden")))
@interface ChangeConfirmationController : UIViewController
{
    id <ChangeConfirmationControllerDelegate> _delegate;
    UILabel *_labelHelperText;
    UIImageView *_imageChangeNumber;
}

@property(retain, nonatomic) UIImageView *imageChangeNumber; // @synthesize imageChangeNumber=_imageChangeNumber;
@property(retain, nonatomic) UILabel *labelHelperText; // @synthesize labelHelperText=_labelHelperText;

- (void)viewWillAppear:(BOOL)arg1;
- (void)viewDidLayoutSubviews;
- (void)loadView;
- (void)nextAction:(id)arg1;
- (void)cancelAction:(id)arg1;
- (id)initWithDelegate:(id)arg1;

@end

