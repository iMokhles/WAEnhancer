//
//  ColorViewController.h
//  UIColors
//
//  Created by Bailey Seymour on 1/23/14.
//
//

#import <UIKit/UIKit.h>

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)

@class PFColorTransparentView, PFColorPicker;
@protocol PFColorPickerDelegate;

@interface PFColorViewController : UIViewController <PFColorPickerDelegate, UIAlertViewDelegate>
{
    //HSB
    UISlider *hueSlider;
    UISlider *saturationSlider;
    UISlider *brightnessSlider;
    UISlider *alphaSlider;
    
    UIView *controlsContainer;
    PFColorTransparentView *transparent;
    
    CGFloat currentAlpha;
}

@property (nonatomic, strong) PFColorPicker *colorPicker;
@property (nonatomic, assign) NSString *defaults; //Required example: @"com.baileyseymour.test"
@property (nonatomic, assign) NSString *key; //Required example @"aColor"
@property (nonatomic, assign) BOOL usesRGB; //Default: false
@property (nonatomic, assign) BOOL usesAlpha; //Default: false
@property (nonatomic, assign) NSString *postNotification;

@end