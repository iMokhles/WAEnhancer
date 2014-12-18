//
//  TotaViewController.m
//  TotaryaTor
//
//  Created by Mokhlas Hussein on 1/4/14.
//
//

#import "BrowseInAppViewController.h"
#import <objc/runtime.h>
#import "ARChromeActivity.h"
#import "MLCruxActivity.h"
#import "PBSafariActivity.h"

UIWindow *addWindow;
UIWindow *previousKeyWindow;
BrowseInAppViewController *sharedInstance;
PBWebViewController *browseWeb;

@interface BrowseInAppViewController ()
- (void)dismiss;
@end

@implementation BrowseInAppViewController
+ (void)eventTriggered:(NSURL *)URL {
	if (sharedInstance) {
		return;
	}
    
	sharedInstance = [[self alloc] init];
    
	addWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	addWindow.windowLevel = UIWindowLevelStatusBar + 1.f;
    
	previousKeyWindow = UIWindow.keyWindow;
    
    //WebView
    browseWeb = [[PBWebViewController alloc] init];
    browseWeb.URL = URL;
    
    // activities
    //PBSafariActivity     *safariActivity     = [[PBSafariActivity alloc] init];
    ARChromeActivity     *chromeActivity     = [[ARChromeActivity alloc] init];
    MLCruxActivity       *cruxActivity       = [[MLCruxActivity alloc] init];
    
    browseWeb.applicationActivities = @[/*safariActivity, */chromeActivity, cruxActivity];
    
    // This property also corresponds to the same one on UIActivityViewController
    // Both properties do not need to be set unless you want custom actions
    // browseWeb.excludedActivityTypes = @[UIActivityTypeMessage];
    
    //webController = [[EGYWebViewController alloc] initWithURL:URL];
    
	[addWindow addSubview:sharedInstance.view];
	[addWindow makeKeyAndVisible];
}

+ (BOOL)isVisible {
    return [sharedInstance isViewLoaded] && sharedInstance.view.window;
}

- (void)loadView {
	[super loadView];
    // Class ChatViewController = objc_getClass("ChatViewController");
    // ChatViewController *chatviewController = [[ChatViewController alloc] init];
    
	navigationController = [[UINavigationController alloc] initWithRootViewController:browseWeb];
	navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
}
- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self presentViewController:navigationController animated:NO completion:NULL];
    //[self.view addSubview:browseWeb.view];
}

- (void)dismiss {
	[sharedInstance dismissViewControllerAnimated:NO completion:^{
		[sharedInstance performSelector:@selector(_dismissCompleted) withObject:nil afterDelay:0.35f];
	}];
}

+ (void)dismiss {
	if (!sharedInstance) {
		return;
	}
    
	[sharedInstance dismiss]; //Back in my day, we could call our own class methods from instance methods...
}

- (void)_dismissCompleted {
	[previousKeyWindow makeKeyWindow];
	//[previousKeyWindow release];
	previousKeyWindow = nil;
    
	//[addWindow release];
	addWindow = nil;
    
	//[sharedInstance release];
	sharedInstance = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(BOOL)interfaceOrientation {
	return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ? YES : interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}
/*
- (void)dealloc {
	[navigationController release];
	[super dealloc];
}*/
@end
