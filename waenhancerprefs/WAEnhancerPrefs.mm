#import <Twitter/Twitter.h>
#import <Preferences/PSSpecifier.h>
#import <objc/runtime.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import "ColorPicker/ColorPicker.h"
#import "NSTask.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0)

#define SIDELOADERTINT [UIColor colorWithRed: 50.0/255.0 green: 200.0/255.0 blue: 50.0/255.0 alpha: 1.0]

#define kUrl_FollowOnTwitter @"https://twitter.com/imokhles"
#define kUrl_FollowOnTwitterTeam @"https://twitter.com/i_devt"
#define kUrl_VisitWebSite @"http://imokhles.com"
#define kUrl_VisitWebSiteTeam @"http://idevttweaks.com"
#define kUrl_MakeDonation @"https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=F4ZGWKWBKT82Y"

#define tweak_defaults @"com.imokhles.waenhancercolor"
#define yearMade @"2014"

#define kPreferencesPath @"/User/Library/Preferences/com.imokhles.WAEnhancerPrefs.plist"
#define kPreferencesChanged "com.imokhles.WAEnhancerPrefs.preferences-changed"

static BOOL authenticated = NO;
static BOOL enablePassword = NO;
static NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.imokhles.waenhancercolor.plist"];
static UIAlertView *passwordAlert = nil;
static UITextField *passwordField = [passwordAlert textFieldAtIndex:0];
static NSString *setPassword = [preferences objectForKey:@"Password"];

#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

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

- (void)viewDidAppear:(BOOL)arg1;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewWillDisappear:(BOOL)arg1;
-(void)loadView;
-(void)reloadSpecifier:(PSSpecifier*)specifier animated:(BOOL)animated;
-(void)reloadSpecifier:(PSSpecifier*)specifier;
- (NSArray *)loadSpecifiersFromPlistName:(NSString *)name target:(id)target;
-(PSSpecifier*)specifierForID:(NSString*)specifierID;
@end

@interface WAEnhancerBannerCell : PSTableCell {
    UIImageView *_imageView;
}
@end

@interface WASwitchTableCell : PSSwitchTableCell
@end

@interface WAEnhancerPrefsListController: PSListController <UIAlertViewDelegate, UITextFieldDelegate> {
}
-(void)shareTapped:(UIBarButtonItem *)sender;

@end

@implementation WAEnhancerPrefsListController

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
    NSString *btnTitle;
    NSString *language = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    if ([language isEqualToString:@"ar"]) {
        btnTitle = @"مشاركة";
    } else {
        btnTitle = @"Share";
    }
    UIBarButtonItem *heart = [[UIBarButtonItem alloc] initWithTitle:btnTitle style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
    self.navigationItem.rightBarButtonItem = heart;
    [super loadView];
    
}
- (void)viewWillAppear:(BOOL)animated {
    if (IS_OS_7_OR_LATER) {
        [UISegmentedControl appearanceWhenContainedIn:self.class, nil].tintColor = SIDELOADERTINT;
        [[UISwitch appearanceWhenContainedIn:self.class, nil] setOnTintColor:SIDELOADERTINT];
        self.view.tintColor = SIDELOADERTINT;
        self.navigationController.navigationBar.tintColor = SIDELOADERTINT;
    }

    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (IS_OS_7_OR_LATER) {
        self.view.tintColor = nil;
        self.navigationController.navigationBar.tintColor = nil;
    }
}
- (void)viewDidLoad {
    enablePassword = [[preferences objectForKey:@"Pass-Key"] boolValue];
    NSString *language = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    NSString *waeTitle = @"WAEnahcner";
    if (authenticated) {
        [super viewDidLoad];
		authenticated = NO;
	} else if (enablePassword) {
        if (!authenticated) {
            if ([language isEqualToString:@"ar"]) {
                passwordAlert = [[UIAlertView alloc]
                initWithTitle:@"WAEnhancer" message:[NSString stringWithFormat:@"كلمة المرور مطلوبة لفتح الاعدادات %@",waeTitle]
                delegate:self 
                cancelButtonTitle:@"الغاء" 
                otherButtonTitles:@"فتح", nil];
                
                [passwordAlert addTextFieldWithValue:@"" label:@""];
                
                passwordField = [passwordAlert textFieldAtIndex:0];
                passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
                passwordField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
                passwordField.keyboardAppearance = UIKeyboardAppearanceAlert;
                passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
                passwordField.secureTextEntry = YES;
                passwordField.delegate = self;
                [passwordAlert show];
            } else {
                passwordAlert = [[UIAlertView alloc]
                initWithTitle:@"Authentication Required" message:[NSString stringWithFormat:@"A password is required to launch %@",waeTitle]
                delegate:self 
                cancelButtonTitle:@"Cancel" 
                otherButtonTitles:@"Launch", nil];
                
                [passwordAlert addTextFieldWithValue:@"" label:@""];
                
                passwordField = [passwordAlert textFieldAtIndex:0];
                passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
                passwordField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
                passwordField.keyboardAppearance = UIKeyboardAppearanceAlert;
                passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
                passwordField.secureTextEntry = YES;
                passwordField.delegate = self;
                [passwordAlert show];
            }
        }
    } else {
        [super viewDidLoad];
    }
}

- (void)alertView:(UIAlertView *)alert didDismissWithButtonIndex:(NSInteger)buttonIndex {
	if (alert == passwordAlert) {
        
		if (buttonIndex == 1) {
            
			if ([passwordField.text isEqualToString:setPassword]) {
                
				authenticated = YES;
				[self viewDidLoad];
                
			} else {
                
				UIAlertView *errorAlert = [[UIAlertView alloc]
                                           initWithTitle:@"Authentication Failed" message:@"Incorrect Password."
                                           delegate:self
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
                
				[errorAlert show];
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    //Here your non-main thread.
                    [NSThread sleepForTimeInterval:2.0f];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //Here you returns to main thread.
                        system("killall Settings");
                    });
                });
			}
		} else if (buttonIndex == 0) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //Here your non-main thread.
                [NSThread sleepForTimeInterval:2.0f];
                dispatch_async(dispatch_get_main_queue(), ^{
                    //Here you returns to main thread.
                    system("killall Settings");
                });
            });
        }
	}
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
    
	NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects: @"-c", @"dpkg -s com.imokhles.WAEnhancer | grep 'Version'", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput:pipe];
    [task launch];
    NSData *data = [[[task standardOutput] fileHandleForReading] readDataToEndOfFile];
    NSString *version = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSString *subString = [version substringFromIndex:[version length] - 4];
    //[pipe release]; //crashes
    return subString;
}

- (void)openColorPicker:(PSSpecifier*)specifier {
    NSString *saveKey = [[specifier properties] objectForKey:@"saveKey"];
    NSString *notification = [specifier propertyForKey:@"PostNotification"];
    
    PFColorViewController *colorPickerPrefs = [[PFColorViewController alloc] init];
    // [colorPickerPrefs colorFromDefaults:tweak_defaults withKey:saveKey];
    colorPickerPrefs.defaults = tweak_defaults;
    colorPickerPrefs.key = saveKey;
    colorPickerPrefs.title = [[specifier properties] objectForKey:@"title"];
    colorPickerPrefs.usesRGB = NO; //Using HSB for a more user-friendly color picker
    colorPickerPrefs.usesAlpha = NO;
    
    if (notification) {
        colorPickerPrefs.postNotification = notification;
    }
    [self pushController:colorPickerPrefs animate:YES];
}

- (NSString *)dynamicYear {
   
    NSString *dynamicYear = @"";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormatter setDateFormat:@"yyyy"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *date = [NSDate date];
    NSString *dateString = [dateFormatter stringFromDate:date];
    if([yearMade isEqual:dateString]){
    dynamicYear = dateString;
    } else {
    dynamicYear = [NSString stringWithFormat:@"%@ - %@", yearMade, dateString];
    }
   [dateFormatter release];

return dynamicYear;
}

-(void)shareTapped:(UIBarButtonItem *)sender {
    NSString *text;

    // NSString *btnTitle;
    NSString *language = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    if ([language isEqualToString:@"ar"]) {
        text = @"استخدم اداة #WAEnhancer بواسطة @iMokhles لاهم المميزات المطلوبة من المستخدم في تطبيق #WhatsApp";
    } else {
        text = @"I like #WAEnhancer by @iMokhles the most wanted features for WhatsApp!";
    }    
	if (objc_getClass("UIActivityViewController")) {
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
		_specifiers = [[self loadSpecifiersFromPlistName:@"WAEnhancerPrefs" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation WAEnhancerBannerCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headerCell" specifier:specifier];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:0.369f green:0.169f blue:0.361f alpha:1.0f]];
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

@implementation WASwitchTableCell
-(id)initWithStyle:(int)style reuseIdentifier:(NSString *)identifier specifier:(PSSpecifier *)spec {
    self = [super initWithStyle:style reuseIdentifier:identifier specifier:spec];
    if (self) {
        
		if ([spec.identifier isEqualToString:@"black"]) {
            
			[((UISwitch *)[self control]) setOnTintColor:[UIColor blackColor]];
            
		} else if ([spec.identifier isEqualToString:@"yellow"]) {
            
			[((UISwitch *)[self control]) setOnTintColor:[UIColor yellowColor]];

		} else if ([spec.identifier isEqualToString:@"turquoise"]) {
            
            [((UISwitch *)[self control]) setOnTintColor:[UIColor magentaColor]];
            
        } else if ([spec.identifier isEqualToString:@"emerlad"]) {
            
            [((UISwitch *)[self control]) setOnTintColor:[UIColor greenColor]];
            
        } else if ([spec.identifier isEqualToString:@"alizarin"]) {
            
            [((UISwitch *)[self control]) setOnTintColor:[UIColor redColor]];
            
        } else if ([spec.identifier isEqualToString:@"amethyst"]) {
            
            [((UISwitch *)[self control]) setOnTintColor:[UIColor purpleColor]];
            
        } else if ([spec.identifier isEqualToString:@"wetasphalt"]) {
            
            [((UISwitch *)[self control]) setOnTintColor:[UIColor blueColor]];
            
        } else if ([spec.identifier isEqualToString:@"sphalt"]) {
            
            [((UISwitch *)[self control]) setOnTintColor:[UIColor darkGrayColor]];
            
        }
        
	}
    
	return self;
}
@end

// vim:ft=objc
