//
//  ImageFilterProcessViewController.h
//  MeiJiaLove
//
//  Created by Wu.weibin on 13-7-9.
//  Copyright (c) 2013年 Wu.weibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageFitlerProcessDelegate;

@protocol ImageFitlerProcessDelegate <NSObject>
- (void)imageFitlerProcessDone:(UIImage *)image;
- (void)imageFitlerProcessClose;
@end

@interface ImageFilterProcessViewController : UIViewController <UIGestureRecognizerDelegate>
@property (nonatomic, strong) id <ImageFitlerProcessDelegate> delegate;
@property (nonatomic, strong) UIImage *currentImage;
@property (nonatomic, strong) UIImageView *rootImageView;
@property (nonatomic, strong) UIScrollView *scrollerView;
@end
