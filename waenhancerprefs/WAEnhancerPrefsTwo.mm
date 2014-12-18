#import <Twitter/Twitter.h>
#import <Preferences/PSSpecifier.h>
#import <objc/runtime.h>
#import <Preferences/PSTableCell.h>

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)

#define kUrl_FollowOnTwitter @"https://twitter.com/imokhles"
#define kUrl_FollowOnTwitterTeam @"https://twitter.com/i_devt"
#define kUrl_VisitWebSite @"http://imokhles.com"
#define kUrl_VisitWebSiteTeam @"http://idevttweaks.com"
#define kUrl_MakeDonation @"https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=F4ZGWKWBKT82Y"

#define kPreferencesPath @"/User/Library/Preferences/com.imokhles.WAEnhancerPrefs.plist"
#define kPreferencesChanged "com.imokhles.WAEnhancerPrefs.preferences-changed"

static NSBundle* getBundle() {
    return [NSBundle bundleWithPath:@"/Library/PreferenceBundles/WAEnhancerPrefs.bundle"];
}

@interface PSTableCell()
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier;
@end

@interface PSViewController : UIViewController
-(id)initForContentSize:(CGSize)contentSize;
-(void)setPreferenceValue:(id)value specifier:(id)specifier;
@end

@interface PSListController : PSViewController{
	NSArray *_specifiers;
}

-(void)loadView;
-(void)reloadSpecifier:(PSSpecifier*)specifier animated:(BOOL)animated;
-(void)reloadSpecifier:(PSSpecifier*)specifier;
- (NSArray *)loadSpecifiersFromPlistName:(NSString *)name target:(id)target;
-(PSSpecifier*)specifierForID:(NSString*)specifierID;
@end

@interface BannerCellTwo : PSTableCell {
    UIImageView *_imageView;
}
@end

@interface WAEnhancerPrefsTwoListController: PSListController {
}
-(void)shareTapped:(UIBarButtonItem *)sender;

@end

@implementation WAEnhancerPrefsTwoListController

-(id) readPreferenceValue:(PSSpecifier*)specifier {
    NSDictionary *TGAnyFilesSettings = [NSDictionary dictionaryWithContentsOfFile:kPreferencesPath];
    if (!TGAnyFilesSettings[specifier.properties[@"key"]]) {
        return specifier.properties[@"default"];
    }
    return TGAnyFilesSettings[specifier.properties[@"key"]];
}

-(void) setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:kPreferencesPath]];
    NSLog(@"TGAnyFiles: [DEBUG] %@",specifier.properties);
    [defaults setObject:value forKey:specifier.properties[@"key"]];
    [defaults writeToFile:kPreferencesPath atomically:YES];
    NSDictionary *TGAnyFilesSettings = [NSDictionary dictionaryWithContentsOfFile:kPreferencesPath];
    NSLog(@"TGAnyFiles: [DEBUG] TGAnyFilesSettings %@",TGAnyFilesSettings);
    NSLog(@"TGAnyFiles: [DEBUG] posting CFNotification %@", specifier.properties[@"PostNotification"]);
    CFStringRef imokhlesPost = (CFStringRef)specifier.properties[@"PostNotification"];
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), imokhlesPost, NULL, NULL, YES);
}

-(void)loadView {
    NSString *btnTitle = NSLocalizedString(@"Share", @"Share");
	UIBarButtonItem *heart = [[UIBarButtonItem alloc] initWithTitle:btnTitle style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
	self.navigationItem.rightBarButtonItem = heart;
	[super loadView];
    
}

- (void)followOnTwitter:(PSSpecifier*)specifier {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:kUrl_FollowOnTwitter]];
}

- (void)followOnTwitterTeam:(PSSpecifier*)specifier {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:kUrl_FollowOnTwitterTeam]];
}
- (void)visitWebSite:(PSSpecifier*)specifier {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:kUrl_VisitWebSite]];
}

- (void)visitWebSiteTeam:(PSSpecifier*)specifier {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:kUrl_VisitWebSiteTeam]];
}
- (void)makeDonation:(PSSpecifier *)specifier {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:kUrl_MakeDonation]];
}

- (NSString *)versionValue:(PSSpecifier *)specifier {
    
	return @"1.1-3";
}

-(void)shareTapped:(UIBarButtonItem *)sender {
    
    NSString *text = NSLocalizedString(@"I like #WAEnhancer by @iMokhles the most wanted features for WhatsApp!", @"I like #WAEnhancer by @iMokhles the most wanted features for WhatsApp!");
    
	if (objc_getClass("TWTweetComposeViewController") && [TWTweetComposeViewController canSendTweet]) {
		TWTweetComposeViewController *viewController = [[[TWTweetComposeViewController alloc] init] autorelease];
		viewController.initialText = text;
		[self.navigationController presentViewController:viewController animated:YES completion:NULL];
	}
    
	else if (objc_getClass("UIActivityViewController")) {
		UIActivityViewController *viewController = [[[UIActivityViewController alloc] initWithActivityItems:[NSArray arrayWithObjects:text, nil] applicationActivities:nil] autorelease];
		[self.navigationController presentViewController:viewController animated:YES completion:NULL];
	}
    
	else {
		text = [text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://twitter.com/intent/tweet?text=%@", text]]];
	}
}

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"WAEnhancerPrefsTwo" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation BannerCellTwo
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headerCell" specifier:specifier];
    if (self) {
        
        if (IS_IPHONE) {
            _imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[getBundle() pathForResource:@"WAEnhancerHeader" ofType:@"png"]]];
            [self addSubview:_imageView];
        } else if (IS_IPHONE_5) {
            _imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[getBundle() pathForResource:@"WAEnhancerHeader" ofType:@"png"]]];
            [self addSubview:_imageView];
        }
        
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[getBundle() pathForResource:@"banner" ofType:@"png"]]];
        [self addSubview:_imageView];
        [_imageView release];
    }
    return self;
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1
{
    // Return a custom cell height.
    if (IS_IPHONE) {
        return 192.0f;
    } else if (IS_IPHONE_5) {
        return 384.0f;
    } else if (IS_IPAD) {
        return 384.0f;
    } else if (IS_RETINA) {
        return 384.0f;
    }
    return 384.0f;
}
@end

// vim:ft=objc
