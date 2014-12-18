
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

#import "WAHeaders/DecFile.h"
#import "Vendors/OpenIn/BrowseInAppViewController.h"
#import "Vendors/AntiCrack/iDevTCk.h"
#import "AESCrypt.h"
#import "NSString+UAObfuscatedString.h"

static UIColor *clearColor = [UIColor clearColor];
static UIColor *blueColor = [UIColor blueColor];
static UIColor *greenColor = [UIColor greenColor];
static UIColor *blackColor = [UIColor blackColor];
static UIColor *brownColor = [UIColor brownColor];
static UIColor *purpleColor = [UIColor purpleColor];
static UIColor *redColor = [UIColor redColor];
static UIColor *orangeColor = [UIColor orangeColor];
static UIColor *darkGrayColor = [UIColor darkGrayColor];
static UIColor *lightGrayColor = [UIColor lightGrayColor];
static UIColor *grayColor = [UIColor grayColor];
static UIColor *cyanColor = [UIColor cyanColor];
static UIColor *yellowColor = [UIColor yellowColor];
static UIColor *magentaColor = [UIColor magentaColor];
static UIColor *whiteColor = [UIColor whiteColor];

static BOOL WhatsApp = NO;
static BOOL WhatsApp1 = NO;
static BOOL WhatsApp2 = NO;
static BOOL WhatsApp3 = NO;
static BOOL WhatsApp4 = NO;
static BOOL WhatsApp5 = NO;

#define WHATSAPP_ID @"net.whatsapp.WhatsApp"
#define WHATSAPP1_ID @"net.whatsapp.WhatsApp1"
#define WHATSAPP2_ID @"net.whatsapp.WhatsApp2"
#define WHATSAPP3_ID @"net.whatsapp.WhatsApp3"
#define WHATSAPP4_ID @"net.whatsapp.WhatsApp4"
#define WHATSAPP5_ID @"net.whatsapp.WhatsApp5"

static BOOL disableWrite = NO;
#define kDisableWriteKey @"WAEDisableWrite"

#define kPreferencesPath @"/User/Library/Preferences/com.imokhles.WAEnhancerPrefs.plist"
#define kPreferencesChanged "com.imokhles.WAEnhancerPrefs.preferences-changed"

#define WAELANGUAGE [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0]

#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

static void WAEnhancerInitPrefs() {
    NSDictionary *WAEnhancerSettings = [NSDictionary dictionaryWithContentsOfFile:kPreferencesPath];
    NSNumber *textWALKNU = WAEnhancerSettings[PREFERENCES_ENABLED_TEXTWALK_KEY];
    textWALK = textWALKNU ? [textWALKNU boolValue] : 0;

    NSNumber *openLinkNU = WAEnhancerSettings[PREFERENCES_ENABLED_OLINK_KEY];
    openLink = openLinkNU ? [openLinkNU boolValue] : 0;

    NSNumber *bcSelectAllNU = WAEnhancerSettings[PREFERENCES_ENABLED_SelectALL_KEY];
    bcSelectAll = bcSelectAllNU ? [bcSelectAllNU boolValue] : 1;

    NSNumber *unlimitedMediaNU = WAEnhancerSettings[PREFERENCES_ENABLED_UnlimitedMedia_KEY];
    unlimitedMedia = unlimitedMediaNU ? [unlimitedMediaNU boolValue] : 1;

    NSNumber *unlimitedStatusNU = WAEnhancerSettings[PREFERENCES_ENABLED_UnlimitedListStatus_KEY];
    unlimitedStatus = unlimitedStatusNU ? [unlimitedStatusNU boolValue] : 1;

    NSNumber *unlimitedSubjectsNU = WAEnhancerSettings[PREFERENCES_ENABLED_UnlimitedSubjects_KEY];
    unlimitedSubjects = unlimitedSubjectsNU ? [unlimitedSubjectsNU boolValue] : 1;

    NSNumber *unlimitedPhotosNU = WAEnhancerSettings[PREFERENCES_ENABLED_UnlimitedPhotos_KEY];
    unlimitedPhotos = unlimitedPhotosNU ? [unlimitedPhotosNU boolValue] : 1;

    NSNumber *lastSeenNU = WAEnhancerSettings[PREFERENCES_ENABLED_LASTSEEN_KEY];
    lastSeen = lastSeenNU ? [lastSeenNU boolValue] : 1;

    NSNumber *shareStyleNU = WAEnhancerSettings[PREFERENCES_ENABLED_ShareStyle_KEY];
    shareStyle = shareStyleNU ? [shareStyleNU boolValue] : 1;

    NSNumber *mediaOptionsNU = WAEnhancerSettings[PREFERENCES_ENABLED_MediaOPTIONS_KEY];
    mediaOptions = mediaOptionsNU ? [mediaOptionsNU boolValue] : 1;

    NSNumber *profilePicNU = WAEnhancerSettings[PREFERENCES_ENABLED_ProfilePIC_KEY];
    profilePic = profilePicNU ? [profilePicNU boolValue] : 1;

    NSNumber *colorPrefsNU = WAEnhancerSettings[PREFERENCES_FONTCOLOR_KEY];
    colorPrefs = colorPrefsNU ? [colorPrefsNU integerValue] : 3;

    NSNumber *urlColorNU = WAEnhancerSettings[PREFERENCES_URLCOLOR_KEY];
    urlColor = urlColorNU ? [urlColorNU integerValue] : 1;

    NSNumber *showKeyboardNU = WAEnhancerSettings[PREFERENCES_SHOWKEYBOARD_KEY];
    showKeyboard = showKeyboardNU ? [showKeyboardNU boolValue] : 1;

    NSNumber *hideCameraNU = WAEnhancerSettings[PREFERENCES_HIDECAMERA_KEY];
    hideCamera = hideCameraNU ? [hideCameraNU boolValue] : 1;

    NSNumber *newSettingsNU = WAEnhancerSettings[@"enSettings"];
    newSettings = newSettingsNU ? [newSettingsNU boolValue] : 0;

    NSNumber *readMarkNU = WAEnhancerSettings[PREFERENCES_ENABLED_READ_KEY];
    readMark = readMarkNU ? [readMarkNU boolValue] : 1;

    NSNumber *disableWriteNU = WAEnhancerSettings[kDisableWriteKey];
    disableWrite = disableWriteNU ? [disableWriteNU boolValue] : 1;

    NSNumber *WhatsAppNU = WAEnhancerSettings[PREFERENCES_ENABLED_WHATSAPP_KEY];
    WhatsApp = WhatsAppNU ? [WhatsAppNU boolValue] : 1;

    NSNumber *WhatsApp1NU = WAEnhancerSettings[PREFERENCES_ENABLED_WHATSAPP1_KEY];
    WhatsApp1 = WhatsApp1NU ? [WhatsApp1NU boolValue] : 1;

    NSNumber *WhatsApp2NU = WAEnhancerSettings[PREFERENCES_ENABLED_WHATSAPP2_KEY];
    WhatsApp2 = WhatsApp2NU ? [WhatsApp2NU boolValue] : 1;

    NSNumber *WhatsApp3NU = WAEnhancerSettings[PREFERENCES_ENABLED_WHATSAPP3_KEY];
    WhatsApp3 = WhatsApp3NU ? [WhatsApp3NU boolValue] : 1;

    NSNumber *WhatsApp4NU = WAEnhancerSettings[PREFERENCES_ENABLED_WHATSAPP4_KEY];
    WhatsApp4 = WhatsApp4NU ? [WhatsApp4NU boolValue] : 1;

    NSNumber *WhatsApp5NU = WAEnhancerSettings[PREFERENCES_ENABLED_WHATSAPP5_KEY];
    WhatsApp5 = WhatsApp5NU ? [WhatsApp5NU boolValue] : 1;

    // NSNumber *WAOpenINEnableVideosOptionKey = WAEnhancerSettings[kEnableVideos];
    // enableVideos = WAOpenINEnableVideosOptionKey ? [WAOpenINEnableVideosOptionKey boolValue] : 1;

}

# pragma mark - WHATSOLD1
%group WHATSOLD1

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook SettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        WAUserProfileInfo *userProfileInfo = [[objc_getClass("WAUserProfileInfo") alloc] init];
        
        settingsView = [[UIView alloc] initWithFrame:self.view.frame];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:self.labelConnectionStatus.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        //    NSData *imageData = MSHookIvar<NSData *>(userProfileInfo, "_thumbnailData");
        //    UIImage *imageProfile =[UIImage imageWithData:imageData];
        /*
         myImage = [[UIImageView alloc] initWithImage:requestPic.imageProfilePhoto.image];
         [myImage setFrame:CGRectMake(10, 10, 59, 59)];
         [myImage setBackgroundColor:[UIColor blackColor]];
         myImage.layer.cornerRadius = myImage.frame.size.width / 2;
         myImage.layer.masksToBounds = YES;*/
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
    } else {
        %orig;
    }
}

//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//    
//    NSLog(@"Received Notification - myImage = %@", myImage);
//    
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - Last Seen

%hook ChatManager

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    id r = fp8;
    id r1 = fp12;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@", r, r1);
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    id r = fp8;
    id r1 = fp12;
    id r2 = fp16;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@ fp16 : %@", r, r1, r2);
    if (lastSeen) {
        return;
    } else {
        %orig;
    }
}

%end

%hook XMPPConnection

- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}


- (void)internalSendPresence:(id)fp8 {
    %log;
    id r = fp8;
    NSLog(@"xmppConnection  fp8 : %@", r);
    if (lastSeen) return;
    else %orig;
}
-(void)sendDeliveryReceiptAck:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read ack
    } else {
        return %orig;
    }
}

-(void)sendDeliveryReceiptsForChatMessages:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

-(void)internalSendDeliveryReceiptsForStanzas:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk
%hook ChatViewController

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (void)sendFileAction:(id)fp8 {
    // Works
    if (shareStyle) {
        [self hideKeyboard];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}

%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    
    
    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if (self.currentMedia.type == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats,/* SHPhotos,*/ nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    NSString *musicPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        [self saveCurrentVideo];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        [self saveCurrentImage];
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    NSString *photoPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photos URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        // return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end
%end

# pragma mark - WHATSNEW1
%group WHATSNEW1

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end
%hook WASettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        /*Class connectionStatusView = objc_getClass("WAConnectionStatusView");
         WAConnectionStatusView *conStatus = [[connectionStatusView alloc] init];*/
        WAConnectionStatusView *connectionStatus = MSHookIvar<WAConnectionStatusView *>(self, "_connectionStatusView");
        UILabel *statusLabel = MSHookIvar<UILabel *>(connectionStatus, "_statusLabel");
        
        settingsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+55)];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:statusLabel.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        archiveChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(65, 430, 190, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [archiveChatsButton setTitle:@"أرشفة جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [archiveChatsButton setTitle:@"Archive All Conversations" forState:UIControlStateNormal];
        }
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [archiveChatsButton addTarget:self action:@selector(archiveOrUnarchiveAllChatsAction) forControlEvents:UIControlEventTouchUpInside];
        archiveChatsButton.backgroundColor = [UIColor brownColor];
        archiveChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        archiveChatsButton.rippleFromTapLocation = YES;
        archiveChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
        [settingsView addSubview:archiveChatsButton];
    } else {
        %orig;
    }
}
%new
- (void)profileViewControllerDidFinish:(ProfileViewController *)arg1 {
    
}
//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//
//    NSLog(@"Received Notification - myImage = %@", myImage);
//
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk

%hook XMPPConnection

- (id)createPresence:(unsigned int)arg1 withNickname:(id)arg2 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}
- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}

- (void)changeChatState:(unsigned int)arg1 forJID:(id)arg2 {
    if (disableWrite) {
        %orig(0, arg2);
    } else {
        %orig;
    }
}
- (void)sendPresenceWithNickname:(id)arg1 {
    %log;
    
    if (lastSeen) return;
    else return %orig;
}

- (void)sendDeliveryReceiptsForChatMessages:(id)arg1 completion:(id)arg2 {
    if (readMark) {
        %orig(nil, nil); // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

- (void)sendDeliveryReceiptsForMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendRReceiptsForChatMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendPlayedReceiptForMessage:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

%hook ChatViewController

- (void)showQuickCamera {
    if (hideCamera) {
        return;
    } else {
        %orig;
    }
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    WAChatBarManager *chatBarManager = MSHookIvar<WAChatBarManager *>(self, "_chatBarManager");
    
    [[NSNotificationCenter defaultCenter] addObserver:chatBarManager selector:@selector(hideKeyboard) name:@"keyboardWillHide" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retrySendingMessageFromCellData:) name:@"retrySendingMessageFromCellData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteMessagesFromCellData:) name:@"deleteMessagesFromCellData" object:nil];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)alertButtonTappedInCell:(id)arg1 {
    if (shareStyle) {
        shareStyle = NO;
        %orig;
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:@"Delete"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteMessagesFromCellData" object: nil];
        
    }
    if ([buttonTitle isEqualToString:@"Retry Send Message"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"retrySendingMessageFromCellData" object: nil];
        
    }
}

- (void)chatBarManagerWantsToAttachMedia:(id)arg1 {
    // Works
    if (shareStyle) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keyboardWillHide" object: nil];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto caption:@"WAEnhancer - LastImage"];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image caption:@"WAEnhancer - Filterd Image"];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil caption:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image caption:@"WAEnhancer - Edited image"];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}
%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }


    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if ([currentMessage.messageType intValue] == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHVideos, SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *musicPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }

    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        NSURL *sourceURL = [NSURL fileURLWithPath:photoPath];
        NSURLSessionTask *download = [[NSURLSession sharedSession] downloadTaskWithURL:sourceURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
            NSURL *tempURL = [documentsURL URLByAppendingPathComponent:[sourceURL lastPathComponent]];
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:tempURL error:nil];
            UISaveVideoAtPathToSavedPhotosAlbum(tempURL.path, nil, NULL, NULL);
        }];
        [download resume];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        UIImage *image = [UIImage imageWithContentsOfFile:photoPath];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
    if ([buttonTitle isEqualToString:SHVideos]) {
        [self shareVideosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *photoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photo URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%new(v@:@@)
- (void)shareVideosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *videoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:videoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Video URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Videos pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        //return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end

%hook WAChatBar
- (void)layoutSubviews {
    %orig;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    UIButton *cameraButton = MSHookIvar<UIButton *>(self, "_cameraButton");
    UIImageView *imageDiv = MSHookIvar<UIImageView *>(self, "_dividerImageView");
    UIView *inBox = MSHookIvar<UIView *>(self, "_inputBoxView");
    UITextView *inTextView = MSHookIvar<UITextView *>(self, "_inputTextView");
    BOOL isActive = [inTextView isFirstResponder];
    if (hideCamera) {
        [cameraButton removeFromSuperview];
        [imageDiv removeFromSuperview];
        if(orientation == 0) {
            //Default orientation
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationPortrait) {
            //Do something if the orientation is in Portrait
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeLeft) {
            // Do something if Left
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeRight) {
            //Do something if right
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        }
    } else {
        %orig;
    }
}
%end
%hook WhatsAppAppDelegate
- (void)presentHelperScreenIfNecessary {
   return;
}
%end
%end

# pragma mark - WHATSOLD2
%group WHATSOLD2

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook SettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        WAUserProfileInfo *userProfileInfo = [[objc_getClass("WAUserProfileInfo") alloc] init];
        
        settingsView = [[UIView alloc] initWithFrame:self.view.frame];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:self.labelConnectionStatus.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        //    NSData *imageData = MSHookIvar<NSData *>(userProfileInfo, "_thumbnailData");
        //    UIImage *imageProfile =[UIImage imageWithData:imageData];
        /*
         myImage = [[UIImageView alloc] initWithImage:requestPic.imageProfilePhoto.image];
         [myImage setFrame:CGRectMake(10, 10, 59, 59)];
         [myImage setBackgroundColor:[UIColor blackColor]];
         myImage.layer.cornerRadius = myImage.frame.size.width / 2;
         myImage.layer.masksToBounds = YES;*/
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
    } else {
        %orig;
    }
}

//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//    
//    NSLog(@"Received Notification - myImage = %@", myImage);
//    
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - Last Seen

%hook ChatManager

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    id r = fp8;
    id r1 = fp12;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@", r, r1);
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    id r = fp8;
    id r1 = fp12;
    id r2 = fp16;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@ fp16 : %@", r, r1, r2);
    if (lastSeen) {
        return;
    } else {
        %orig;
    }
}

%end

%hook XMPPConnection

- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}


- (void)internalSendPresence:(id)fp8 {
    %log;
    id r = fp8;
    NSLog(@"xmppConnection  fp8 : %@", r);
    if (lastSeen) return;
    else %orig;
}

-(void)sendDeliveryReceiptAck:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read ack
    } else {
        return %orig;
    }
}

-(void)sendDeliveryReceiptsForChatMessages:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

-(void)internalSendDeliveryReceiptsForStanzas:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk
%hook ChatViewController

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (void)sendFileAction:(id)fp8 {
    // Works
    if (shareStyle) {
        [self hideKeyboard];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}

%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    
    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if (self.currentMedia.type == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats,/* SHPhotos,*/ nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    NSString *musicPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        [self saveCurrentVideo];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        [self saveCurrentImage];
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    NSString *photoPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photos URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        // return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end
%end

# pragma mark - WHATSNEW2
%group WHATSNEW2

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook WASettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        /*Class connectionStatusView = objc_getClass("WAConnectionStatusView");
         WAConnectionStatusView *conStatus = [[connectionStatusView alloc] init];*/
        WAConnectionStatusView *connectionStatus = MSHookIvar<WAConnectionStatusView *>(self, "_connectionStatusView");
        UILabel *statusLabel = MSHookIvar<UILabel *>(connectionStatus, "_statusLabel");
        
        settingsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+55)];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:statusLabel.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        archiveChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(65, 430, 190, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [archiveChatsButton setTitle:@"أرشفة جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [archiveChatsButton setTitle:@"Archive All Conversations" forState:UIControlStateNormal];
        }
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [archiveChatsButton addTarget:self action:@selector(archiveOrUnarchiveAllChatsAction) forControlEvents:UIControlEventTouchUpInside];
        archiveChatsButton.backgroundColor = [UIColor brownColor];
        archiveChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        archiveChatsButton.rippleFromTapLocation = YES;
        archiveChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
        [settingsView addSubview:archiveChatsButton];
    } else {
        %orig;
    }
}
%new
- (void)profileViewControllerDidFinish:(ProfileViewController *)arg1 {
    
}
//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//
//    NSLog(@"Received Notification - myImage = %@", myImage);
//
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk

%hook XMPPConnection

- (id)createPresence:(unsigned int)arg1 withNickname:(id)arg2 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}
- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}

- (void)changeChatState:(unsigned int)arg1 forJID:(id)arg2 {
    if (disableWrite) {
        %orig(0, arg2);
    } else {
        %orig;
    }
}
- (void)sendPresenceWithNickname:(id)arg1 {
    %log;
    
    if (lastSeen) return;
    else return %orig;
}

- (void)sendDeliveryReceiptsForChatMessages:(id)arg1 completion:(id)arg2 {
    if (readMark) {
        %orig(nil, nil); // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

- (void)sendDeliveryReceiptsForMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendRReceiptsForChatMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendPlayedReceiptForMessage:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

%hook ChatViewController

- (void)showQuickCamera {
    if (hideCamera) {
        return;
    } else {
        %orig;
    }
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    WAChatBarManager *chatBarManager = MSHookIvar<WAChatBarManager *>(self, "_chatBarManager");
    
    [[NSNotificationCenter defaultCenter] addObserver:chatBarManager selector:@selector(hideKeyboard) name:@"keyboardWillHide" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retrySendingMessageFromCellData:) name:@"retrySendingMessageFromCellData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteMessagesFromCellData:) name:@"deleteMessagesFromCellData" object:nil];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)alertButtonTappedInCell:(id)arg1 {
    if (shareStyle) {
        shareStyle = NO;
        %orig;
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:@"Delete"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteMessagesFromCellData" object: nil];
        
    }
    if ([buttonTitle isEqualToString:@"Retry Send Message"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"retrySendingMessageFromCellData" object: nil];
        
    }
}

- (void)chatBarManagerWantsToAttachMedia:(id)arg1 {
    // Works
    if (shareStyle) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keyboardWillHide" object: nil];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto caption:@"WAEnhancer - LastImage"];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image caption:@"WAEnhancer - Filterd Image"];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil caption:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image caption:@"WAEnhancer - Edited image"];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}
%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }


    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if ([currentMessage.messageType intValue] == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHVideos, SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *musicPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }

    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        NSURL *sourceURL = [NSURL fileURLWithPath:photoPath];
        NSURLSessionTask *download = [[NSURLSession sharedSession] downloadTaskWithURL:sourceURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
            NSURL *tempURL = [documentsURL URLByAppendingPathComponent:[sourceURL lastPathComponent]];
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:tempURL error:nil];
            UISaveVideoAtPathToSavedPhotosAlbum(tempURL.path, nil, NULL, NULL);
        }];
        [download resume];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        UIImage *image = [UIImage imageWithContentsOfFile:photoPath];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
    if ([buttonTitle isEqualToString:SHVideos]) {
        [self shareVideosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *photoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photo URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%new(v@:@@)
- (void)shareVideosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *videoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:videoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Video URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Videos pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        //return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end

%hook WAChatBar
- (void)layoutSubviews {
    %orig;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    UIButton *cameraButton = MSHookIvar<UIButton *>(self, "_cameraButton");
    UIImageView *imageDiv = MSHookIvar<UIImageView *>(self, "_dividerImageView");
    UIView *inBox = MSHookIvar<UIView *>(self, "_inputBoxView");
    UITextView *inTextView = MSHookIvar<UITextView *>(self, "_inputTextView");
    BOOL isActive = [inTextView isFirstResponder];
    if (hideCamera) {
        [cameraButton removeFromSuperview];
        [imageDiv removeFromSuperview];
        if(orientation == 0) {
            //Default orientation
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationPortrait) {
            //Do something if the orientation is in Portrait
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeLeft) {
            // Do something if Left
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeRight) {
            //Do something if right
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        }
    } else {
        %orig;
    }
}
%end
%hook WhatsAppAppDelegate
- (void)presentHelperScreenIfNecessary {
   return;
}
%end
%end

# pragma mark - WHATSOLD3
%group WHATSOLD3

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook SettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        WAUserProfileInfo *userProfileInfo = [[objc_getClass("WAUserProfileInfo") alloc] init];
        
        settingsView = [[UIView alloc] initWithFrame:self.view.frame];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:self.labelConnectionStatus.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        //    NSData *imageData = MSHookIvar<NSData *>(userProfileInfo, "_thumbnailData");
        //    UIImage *imageProfile =[UIImage imageWithData:imageData];
        /*
         myImage = [[UIImageView alloc] initWithImage:requestPic.imageProfilePhoto.image];
         [myImage setFrame:CGRectMake(10, 10, 59, 59)];
         [myImage setBackgroundColor:[UIColor blackColor]];
         myImage.layer.cornerRadius = myImage.frame.size.width / 2;
         myImage.layer.masksToBounds = YES;*/
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
    } else {
        %orig;
    }
}

//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//    
//    NSLog(@"Received Notification - myImage = %@", myImage);
//    
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - Last Seen

%hook ChatManager

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    id r = fp8;
    id r1 = fp12;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@", r, r1);
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    id r = fp8;
    id r1 = fp12;
    id r2 = fp16;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@ fp16 : %@", r, r1, r2);
    if (lastSeen) {
        return;
    } else {
        %orig;
    }
}

%end

%hook XMPPConnection

- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}


- (void)internalSendPresence:(id)fp8 {
    %log;
    id r = fp8;
    NSLog(@"xmppConnection  fp8 : %@", r);
    if (lastSeen) return;
    else %orig;
}

-(void)sendDeliveryReceiptAck:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read ack
    } else {
        return %orig;
    }
}

-(void)sendDeliveryReceiptsForChatMessages:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

-(void)internalSendDeliveryReceiptsForStanzas:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}

%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk
%hook ChatViewController

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (void)sendFileAction:(id)fp8 {
    // Works
    if (shareStyle) {
        [self hideKeyboard];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}

%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    
    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if (self.currentMedia.type == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats,/* SHPhotos,*/ nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    NSString *musicPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        [self saveCurrentVideo];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        [self saveCurrentImage];
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    NSString *photoPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photos URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        // return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end
%end

# pragma mark - WHATSNEW3
%group WHATSNEW3

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook WASettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        /*Class connectionStatusView = objc_getClass("WAConnectionStatusView");
         WAConnectionStatusView *conStatus = [[connectionStatusView alloc] init];*/
        WAConnectionStatusView *connectionStatus = MSHookIvar<WAConnectionStatusView *>(self, "_connectionStatusView");
        UILabel *statusLabel = MSHookIvar<UILabel *>(connectionStatus, "_statusLabel");
        
        settingsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+55)];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:statusLabel.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        archiveChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(65, 430, 190, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [archiveChatsButton setTitle:@"أرشفة جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [archiveChatsButton setTitle:@"Archive All Conversations" forState:UIControlStateNormal];
        }
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [archiveChatsButton addTarget:self action:@selector(archiveOrUnarchiveAllChatsAction) forControlEvents:UIControlEventTouchUpInside];
        archiveChatsButton.backgroundColor = [UIColor brownColor];
        archiveChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        archiveChatsButton.rippleFromTapLocation = YES;
        archiveChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
        [settingsView addSubview:archiveChatsButton];
    } else {
        %orig;
    }
}
%new
- (void)profileViewControllerDidFinish:(ProfileViewController *)arg1 {
    
}
//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//
//    NSLog(@"Received Notification - myImage = %@", myImage);
//
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk

%hook XMPPConnection

- (id)createPresence:(unsigned int)arg1 withNickname:(id)arg2 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}
- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}

- (void)changeChatState:(unsigned int)arg1 forJID:(id)arg2 {
    if (disableWrite) {
        %orig(0, arg2);
    } else {
        %orig;
    }
}
- (void)sendPresenceWithNickname:(id)arg1 {
    %log;
    
    if (lastSeen) return;
    else return %orig;
}
- (void)sendDeliveryReceiptsForChatMessages:(id)arg1 completion:(id)arg2 {
    if (readMark) {
        %orig(nil, nil); // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

- (void)sendDeliveryReceiptsForMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendRReceiptsForChatMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendPlayedReceiptForMessage:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

%hook ChatViewController

- (void)showQuickCamera {
    if (hideCamera) {
        return;
    } else {
        %orig;
    }
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    WAChatBarManager *chatBarManager = MSHookIvar<WAChatBarManager *>(self, "_chatBarManager");
    
    [[NSNotificationCenter defaultCenter] addObserver:chatBarManager selector:@selector(hideKeyboard) name:@"keyboardWillHide" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retrySendingMessageFromCellData:) name:@"retrySendingMessageFromCellData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteMessagesFromCellData:) name:@"deleteMessagesFromCellData" object:nil];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)alertButtonTappedInCell:(id)arg1 {
    if (shareStyle) {
        shareStyle = NO;
        %orig;
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:@"Delete"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteMessagesFromCellData" object: nil];
        
    }
    if ([buttonTitle isEqualToString:@"Retry Send Message"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"retrySendingMessageFromCellData" object: nil];
        
    }
}

- (void)chatBarManagerWantsToAttachMedia:(id)arg1 {
    // Works
    if (shareStyle) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keyboardWillHide" object: nil];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto caption:@"WAEnhancer - LastImage"];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image caption:@"WAEnhancer - Filterd Image"];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil caption:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image caption:@"WAEnhancer - Edited image"];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}
%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }


    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if ([currentMessage.messageType intValue] == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHVideos, SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *musicPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }

    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        NSURL *sourceURL = [NSURL fileURLWithPath:photoPath];
        NSURLSessionTask *download = [[NSURLSession sharedSession] downloadTaskWithURL:sourceURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
            NSURL *tempURL = [documentsURL URLByAppendingPathComponent:[sourceURL lastPathComponent]];
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:tempURL error:nil];
            UISaveVideoAtPathToSavedPhotosAlbum(tempURL.path, nil, NULL, NULL);
        }];
        [download resume];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        UIImage *image = [UIImage imageWithContentsOfFile:photoPath];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
    if ([buttonTitle isEqualToString:SHVideos]) {
        [self shareVideosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *photoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photo URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%new(v@:@@)
- (void)shareVideosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *videoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:videoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Video URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Videos pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        //return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end

%hook WAChatBar
- (void)layoutSubviews {
    %orig;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    UIButton *cameraButton = MSHookIvar<UIButton *>(self, "_cameraButton");
    UIImageView *imageDiv = MSHookIvar<UIImageView *>(self, "_dividerImageView");
    UIView *inBox = MSHookIvar<UIView *>(self, "_inputBoxView");
    UITextView *inTextView = MSHookIvar<UITextView *>(self, "_inputTextView");
    BOOL isActive = [inTextView isFirstResponder];
    if (hideCamera) {
        [cameraButton removeFromSuperview];
        [imageDiv removeFromSuperview];
        if(orientation == 0) {
            //Default orientation
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationPortrait) {
            //Do something if the orientation is in Portrait
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeLeft) {
            // Do something if Left
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeRight) {
            //Do something if right
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        }
    } else {
        %orig;
    }
}
%end
%hook WhatsAppAppDelegate
- (void)presentHelperScreenIfNecessary {
   return;
}
%end
%end

# pragma mark - WHATSOLD4
%group WHATSOLD4

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook SettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        WAUserProfileInfo *userProfileInfo = [[objc_getClass("WAUserProfileInfo") alloc] init];
        
        settingsView = [[UIView alloc] initWithFrame:self.view.frame];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:self.labelConnectionStatus.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        //    NSData *imageData = MSHookIvar<NSData *>(userProfileInfo, "_thumbnailData");
        //    UIImage *imageProfile =[UIImage imageWithData:imageData];
        /*
         myImage = [[UIImageView alloc] initWithImage:requestPic.imageProfilePhoto.image];
         [myImage setFrame:CGRectMake(10, 10, 59, 59)];
         [myImage setBackgroundColor:[UIColor blackColor]];
         myImage.layer.cornerRadius = myImage.frame.size.width / 2;
         myImage.layer.masksToBounds = YES;*/
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
    } else {
        %orig;
    }
}

//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//    
//    NSLog(@"Received Notification - myImage = %@", myImage);
//    
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - Last Seen

%hook ChatManager

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    id r = fp8;
    id r1 = fp12;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@", r, r1);
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    id r = fp8;
    id r1 = fp12;
    id r2 = fp16;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@ fp16 : %@", r, r1, r2);
    if (lastSeen) {
        return;
    } else {
        %orig;
    }
}

%end

%hook XMPPConnection

- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}


- (void)internalSendPresence:(id)fp8 {
    %log;
    id r = fp8;
    NSLog(@"xmppConnection  fp8 : %@", r);
    if (lastSeen) return;
    else %orig;
}

-(void)sendDeliveryReceiptAck:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read ack
    } else {
        return %orig;
    }
}

-(void)sendDeliveryReceiptsForChatMessages:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

-(void)internalSendDeliveryReceiptsForStanzas:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk
%hook ChatViewController

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (void)sendFileAction:(id)fp8 {
    // Works
    if (shareStyle) {
        [self hideKeyboard];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}

%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    
    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if (self.currentMedia.type == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats,/* SHPhotos,*/ nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    NSString *musicPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        [self saveCurrentVideo];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        [self saveCurrentImage];
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    NSString *photoPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photos URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        // return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end
%end

# pragma mark - WHATSNEW4
%group WHATSNEW4

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook WASettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        /*Class connectionStatusView = objc_getClass("WAConnectionStatusView");
         WAConnectionStatusView *conStatus = [[connectionStatusView alloc] init];*/
        WAConnectionStatusView *connectionStatus = MSHookIvar<WAConnectionStatusView *>(self, "_connectionStatusView");
        UILabel *statusLabel = MSHookIvar<UILabel *>(connectionStatus, "_statusLabel");
        
        settingsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+55)];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:statusLabel.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        archiveChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(65, 430, 190, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [archiveChatsButton setTitle:@"أرشفة جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [archiveChatsButton setTitle:@"Archive All Conversations" forState:UIControlStateNormal];
        }
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [archiveChatsButton addTarget:self action:@selector(archiveOrUnarchiveAllChatsAction) forControlEvents:UIControlEventTouchUpInside];
        archiveChatsButton.backgroundColor = [UIColor brownColor];
        archiveChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        archiveChatsButton.rippleFromTapLocation = YES;
        archiveChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
        [settingsView addSubview:archiveChatsButton];
    } else {
        %orig;
    }
}
%new
- (void)profileViewControllerDidFinish:(ProfileViewController *)arg1 {
    
}
//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//
//    NSLog(@"Received Notification - myImage = %@", myImage);
//
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk

%hook XMPPConnection

- (id)createPresence:(unsigned int)arg1 withNickname:(id)arg2 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}
- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}

- (void)changeChatState:(unsigned int)arg1 forJID:(id)arg2 {
    if (disableWrite) {
        %orig(0, arg2);
    } else {
        %orig;
    }
}
- (void)sendPresenceWithNickname:(id)arg1 {
    %log;
    
    if (lastSeen) return;
    else return %orig;
}
- (void)sendDeliveryReceiptsForChatMessages:(id)arg1 completion:(id)arg2 {
    if (readMark) {
        %orig(nil, nil); // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

- (void)sendDeliveryReceiptsForMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendRReceiptsForChatMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendPlayedReceiptForMessage:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

%hook ChatViewController

- (void)showQuickCamera {
    if (hideCamera) {
        return;
    } else {
        %orig;
    }
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    WAChatBarManager *chatBarManager = MSHookIvar<WAChatBarManager *>(self, "_chatBarManager");
    
    [[NSNotificationCenter defaultCenter] addObserver:chatBarManager selector:@selector(hideKeyboard) name:@"keyboardWillHide" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retrySendingMessageFromCellData:) name:@"retrySendingMessageFromCellData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteMessagesFromCellData:) name:@"deleteMessagesFromCellData" object:nil];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)alertButtonTappedInCell:(id)arg1 {
    if (shareStyle) {
        shareStyle = NO;
        %orig;
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:@"Delete"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteMessagesFromCellData" object: nil];
        
    }
    if ([buttonTitle isEqualToString:@"Retry Send Message"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"retrySendingMessageFromCellData" object: nil];
        
    }
}

- (void)chatBarManagerWantsToAttachMedia:(id)arg1 {
    // Works
    if (shareStyle) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keyboardWillHide" object: nil];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto caption:@"WAEnhancer - LastImage"];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image caption:@"WAEnhancer - Filterd Image"];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil caption:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image caption:@"WAEnhancer - Edited image"];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}
%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }


    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if ([currentMessage.messageType intValue] == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHVideos, SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *musicPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }

    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        NSURL *sourceURL = [NSURL fileURLWithPath:photoPath];
        NSURLSessionTask *download = [[NSURLSession sharedSession] downloadTaskWithURL:sourceURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
            NSURL *tempURL = [documentsURL URLByAppendingPathComponent:[sourceURL lastPathComponent]];
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:tempURL error:nil];
            UISaveVideoAtPathToSavedPhotosAlbum(tempURL.path, nil, NULL, NULL);
        }];
        [download resume];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        UIImage *image = [UIImage imageWithContentsOfFile:photoPath];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
    if ([buttonTitle isEqualToString:SHVideos]) {
        [self shareVideosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *photoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photo URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%new(v@:@@)
- (void)shareVideosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *videoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:videoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Video URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Videos pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        //return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end

%hook WAChatBar
- (void)layoutSubviews {
    %orig;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    UIButton *cameraButton = MSHookIvar<UIButton *>(self, "_cameraButton");
    UIImageView *imageDiv = MSHookIvar<UIImageView *>(self, "_dividerImageView");
    UIView *inBox = MSHookIvar<UIView *>(self, "_inputBoxView");
    UITextView *inTextView = MSHookIvar<UITextView *>(self, "_inputTextView");
    BOOL isActive = [inTextView isFirstResponder];
    if (hideCamera) {
        [cameraButton removeFromSuperview];
        [imageDiv removeFromSuperview];
        if(orientation == 0) {
            //Default orientation
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationPortrait) {
            //Do something if the orientation is in Portrait
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeLeft) {
            // Do something if Left
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeRight) {
            //Do something if right
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        }
    } else {
        %orig;
    }
}
%end
%hook WhatsAppAppDelegate
- (void)presentHelperScreenIfNecessary {
   return;
}
%end
%end

# pragma mark - WHATSOLD5
%group WHATSOLD5

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook SettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        WAUserProfileInfo *userProfileInfo = [[objc_getClass("WAUserProfileInfo") alloc] init];
        
        settingsView = [[UIView alloc] initWithFrame:self.view.frame];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:self.labelConnectionStatus.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        //    NSData *imageData = MSHookIvar<NSData *>(userProfileInfo, "_thumbnailData");
        //    UIImage *imageProfile =[UIImage imageWithData:imageData];
        /*
         myImage = [[UIImageView alloc] initWithImage:requestPic.imageProfilePhoto.image];
         [myImage setFrame:CGRectMake(10, 10, 59, 59)];
         [myImage setBackgroundColor:[UIColor blackColor]];
         myImage.layer.cornerRadius = myImage.frame.size.width / 2;
         myImage.layer.masksToBounds = YES;*/
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
    } else {
        %orig;
    }
}

//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//    
//    NSLog(@"Received Notification - myImage = %@", myImage);
//    
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - Last Seen

%hook ChatManager

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    id r = fp8;
    id r1 = fp12;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@", r, r1);
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    id r = fp8;
    id r1 = fp12;
    id r2 = fp16;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@ fp16 : %@", r, r1, r2);
    if (lastSeen) {
        return;
    } else {
        %orig;
    }
}

%end

%hook XMPPConnection

- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}


- (void)internalSendPresence:(id)fp8 {
    %log;
    id r = fp8;
    NSLog(@"xmppConnection  fp8 : %@", r);
    if (lastSeen) return;
    else %orig;
}

-(void)sendDeliveryReceiptAck:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read ack
    } else {
        return %orig;
    }
}

-(void)sendDeliveryReceiptsForChatMessages:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

-(void)internalSendDeliveryReceiptsForStanzas:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}

%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk
%hook ChatViewController

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (void)sendFileAction:(id)fp8 {
    // Works
    if (shareStyle) {
        [self hideKeyboard];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}

%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    
    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if (self.currentMedia.type == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats,/* SHPhotos,*/ nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    NSString *musicPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        [self saveCurrentVideo];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        [self saveCurrentImage];
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    NSString *photoPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photos URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        // return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end
%end

# pragma mark - WHATSNEW5
%group WHATSNEW5

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook WASettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        /*Class connectionStatusView = objc_getClass("WAConnectionStatusView");
         WAConnectionStatusView *conStatus = [[connectionStatusView alloc] init];*/
        WAConnectionStatusView *connectionStatus = MSHookIvar<WAConnectionStatusView *>(self, "_connectionStatusView");
        UILabel *statusLabel = MSHookIvar<UILabel *>(connectionStatus, "_statusLabel");
        
        settingsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+55)];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:statusLabel.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        archiveChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(65, 430, 190, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [archiveChatsButton setTitle:@"أرشفة جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [archiveChatsButton setTitle:@"Archive All Conversations" forState:UIControlStateNormal];
        }
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [archiveChatsButton addTarget:self action:@selector(archiveOrUnarchiveAllChatsAction) forControlEvents:UIControlEventTouchUpInside];
        archiveChatsButton.backgroundColor = [UIColor brownColor];
        archiveChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        archiveChatsButton.rippleFromTapLocation = YES;
        archiveChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
        [settingsView addSubview:archiveChatsButton];
    } else {
        %orig;
    }
}
%new
- (void)profileViewControllerDidFinish:(ProfileViewController *)arg1 {
    
}
//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//
//    NSLog(@"Received Notification - myImage = %@", myImage);
//
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk

%hook XMPPConnection

- (id)createPresence:(unsigned int)arg1 withNickname:(id)arg2 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}
- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}

- (void)changeChatState:(unsigned int)arg1 forJID:(id)arg2 {
    if (disableWrite) {
        %orig(0, arg2);
    } else {
        %orig;
    }
}
- (void)sendPresenceWithNickname:(id)arg1 {
    %log;
    
    if (lastSeen) return;
    else return %orig;
}
- (void)sendDeliveryReceiptsForChatMessages:(id)arg1 completion:(id)arg2 {
    if (readMark) {
        %orig(nil, nil); // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

- (void)sendDeliveryReceiptsForMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendRReceiptsForChatMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendPlayedReceiptForMessage:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

%hook ChatViewController

- (void)showQuickCamera {
    if (hideCamera) {
        return;
    } else {
        %orig;
    }
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    WAChatBarManager *chatBarManager = MSHookIvar<WAChatBarManager *>(self, "_chatBarManager");
    
    [[NSNotificationCenter defaultCenter] addObserver:chatBarManager selector:@selector(hideKeyboard) name:@"keyboardWillHide" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retrySendingMessageFromCellData:) name:@"retrySendingMessageFromCellData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteMessagesFromCellData:) name:@"deleteMessagesFromCellData" object:nil];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)alertButtonTappedInCell:(id)arg1 {
    if (shareStyle) {
        shareStyle = NO;
        %orig;
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:@"Delete"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteMessagesFromCellData" object: nil];
        
    }
    if ([buttonTitle isEqualToString:@"Retry Send Message"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"retrySendingMessageFromCellData" object: nil];
        
    }
}

- (void)chatBarManagerWantsToAttachMedia:(id)arg1 {
    // Works
    if (shareStyle) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keyboardWillHide" object: nil];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto caption:@"WAEnhancer - LastImage"];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image caption:@"WAEnhancer - Filterd Image"];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil caption:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image caption:@"WAEnhancer - Edited image"];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}
%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }


    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if ([currentMessage.messageType intValue] == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHVideos, SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *musicPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }

    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        NSURL *sourceURL = [NSURL fileURLWithPath:photoPath];
        NSURLSessionTask *download = [[NSURLSession sharedSession] downloadTaskWithURL:sourceURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
            NSURL *tempURL = [documentsURL URLByAppendingPathComponent:[sourceURL lastPathComponent]];
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:tempURL error:nil];
            UISaveVideoAtPathToSavedPhotosAlbum(tempURL.path, nil, NULL, NULL);
        }];
        [download resume];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        UIImage *image = [UIImage imageWithContentsOfFile:photoPath];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
    if ([buttonTitle isEqualToString:SHVideos]) {
        [self shareVideosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *photoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photo URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%new(v@:@@)
- (void)shareVideosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *videoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:videoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Video URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Videos pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        //return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end

%hook WAChatBar
- (void)layoutSubviews {
    %orig;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    UIButton *cameraButton = MSHookIvar<UIButton *>(self, "_cameraButton");
    UIImageView *imageDiv = MSHookIvar<UIImageView *>(self, "_dividerImageView");
    UIView *inBox = MSHookIvar<UIView *>(self, "_inputBoxView");
    UITextView *inTextView = MSHookIvar<UITextView *>(self, "_inputTextView");
    BOOL isActive = [inTextView isFirstResponder];
    if (hideCamera) {
        [cameraButton removeFromSuperview];
        [imageDiv removeFromSuperview];
        if(orientation == 0) {
            //Default orientation
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationPortrait) {
            //Do something if the orientation is in Portrait
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeLeft) {
            // Do something if Left
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeRight) {
            //Do something if right
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        }
    } else {
        %orig;
    }
}
%end
%hook WhatsAppAppDelegate
- (void)presentHelperScreenIfNecessary {
   return;
}
%end
%end


# pragma mark - WHATSOLD
%group WHATSOLD

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook SettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        WAUserProfileInfo *userProfileInfo = [[objc_getClass("WAUserProfileInfo") alloc] init];
        
        settingsView = [[UIView alloc] initWithFrame:self.view.frame];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:self.labelConnectionStatus.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:self.labelConnectionStatus.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        //    NSData *imageData = MSHookIvar<NSData *>(userProfileInfo, "_thumbnailData");
        //    UIImage *imageProfile =[UIImage imageWithData:imageData];
        /*
         myImage = [[UIImageView alloc] initWithImage:requestPic.imageProfilePhoto.image];
         [myImage setFrame:CGRectMake(10, 10, 59, 59)];
         [myImage setBackgroundColor:[UIColor blackColor]];
         myImage.layer.cornerRadius = myImage.frame.size.width / 2;
         myImage.layer.masksToBounds = YES;*/
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
    } else {
        %orig;
    }
}

//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//    
//    NSLog(@"Received Notification - myImage = %@", myImage);
//    
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - Last Seen

%hook ChatManager

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    id r = fp8;
    id r1 = fp12;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@", r, r1);
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    id r = fp8;
    id r1 = fp12;
    id r2 = fp16;
    NSLog(@"xmppConnection ChatManager fp8 : %@ fp12 : %@ fp16 : %@", r, r1, r2);
    if (lastSeen) {
        return;
    } else {
        %orig;
    }
}

%end

%hook XMPPConnection

- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) return nil;
    else return %orig;
}


- (void)internalSendPresence:(id)fp8 {
    %log;
    id r = fp8;
    NSLog(@"xmppConnection  fp8 : %@", r);
    if (lastSeen) return;
    else %orig;
}

-(void)sendDeliveryReceiptAck:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read ack
    } else {
        return %orig;
    }
}

-(void)sendDeliveryReceiptsForChatMessages:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

-(void)internalSendDeliveryReceiptsForStanzas:(id)fp8 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}

%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) return;
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return nil;
    else return %orig;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk
%hook ChatViewController

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)xmppConnection:(id)fp8 presenceChanged:(id)fp12 forJID:(id)fp16 {
    %log;
    if (lastSeen) return;
    else %orig;
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (void)sendFileAction:(id)fp8 {
    // Works
    if (shareStyle) {
        [self hideKeyboard];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
    if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
        [self sendDoodle];
    }*/
    if ([item.title isEqualToString:@"Share Music"]) {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
     }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
    WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
    navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}

%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    
    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if (self.currentMedia.type == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats,/* SHPhotos,*/ nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if (self.currentMedia.type == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    NSString *musicPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
    }
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        [self saveCurrentVideo];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        [self saveCurrentImage];
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    NSString *photoPath = self.currentMedia.path;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photos URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        // return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end
%end

# pragma mark - WHATSNEW
%group WHATSNEW

%hook WallpaperSourceViewController
- (void)viewWillAppear:(BOOL)arg1 {
    %orig;
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    activeWallapaperBOOL = [preferences[PREFERENCES_ENABLED_ActiveWallpaper_KEY] boolValue];
    if (activeWallapaperBOOL) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewControllerDidCancel:) name:@"WAEWllpaperCancel" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wallpaperPreviewController:didSelectImage:) name:@"WAEWllpaperDone" object:nil];
        
        BFPaperButton *circle2 = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 225, 120, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [circle2 setTitle:@"خلفيات جديدة" forState:UIControlStateNormal];
        } else {
            [circle2 setTitle:@"New Wallpapers" forState:UIControlStateNormal];
        }
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [circle2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [circle2 addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        circle2.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        circle2.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // circle2.cornerRadius = circle2.frame.size.width / 2;
        circle2.rippleFromTapLocation = YES;
        circle2.rippleBeyondBounds = NO;
        circle2.tapCircleDiameter = MAX(circle2.frame.size.width, circle2.frame.size.height) * 1.3;
        [self.view addSubview:circle2];
        
        // === Wallpaper Browser Options ===
        // Displays the
        BOOL displayActionButton = YES;
        // Displays the Left&Right Navigation Arrows on the bottom of the screen
        BOOL displayNavArrows = YES;
        // Enables the Grid to view all the thumbnails of your wallpapers
        BOOL enableGrid = YES;
        // Starts the view with showing wallpapers in a Grid view
        BOOL startOnGrid = YES;
        
        // Wallpapers Browser Settings ============
        NSMutableArray *wallpapersArray = [[NSMutableArray alloc] init];
        NSMutableArray *thumbsArray = [[NSMutableArray alloc] init];
        MWPhoto *wallpaper;
        
        //Accessing the default documents directory
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] error:nil];
        
        if (self.view.frame.size.height == 568) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPhone/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPhone/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
                
            }
        } else if (self.view.frame.size.height == 1024) {
            NSArray *origWallpaper = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Wallpaper/iPad/" error:nil];
            for (NSString *wallname in origWallpaper) {
                imagePath = [@"/Library/Wallpaper/iPad/" stringByAppendingPathComponent:wallname];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                if ([wallname rangeOfString:@"thumbnail"].location != NSNotFound)
                    [thumbsArray addObject:wallpaper];
                else if ([wallname rangeOfString:@"default"].location != NSNotFound) {
                    
                }
                else
                    [wallpapersArray addObject:wallpaper];
            }
        }
        
        /*self.imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"photo-%d", indexPh]];*/
        
        for (NSString *filename in contents) {
            if( [[filename pathExtension] caseInsensitiveCompare:@"png"] == NSOrderedSame || [[filename pathExtension] caseInsensitiveCompare:@"jpg"] == NSOrderedSame ) {
                // strings are equal but may not be same case
                imagePath = [[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/Wallpapers/"] stringByAppendingPathComponent:filename];
                wallpaper = [MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:imagePath]];
                [wallpapersArray addObject:wallpaper];
                [thumbsArray addObject:wallpaper];
            }
        }
        
        // Gathers all the created wallpapers and thumbnails together =======
        wallpapers = wallpapersArray;
        thumbs = thumbsArray;
        
        // Creates the Wallpapers Browser =========
        browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = displayActionButton;
        browser.displayNavArrows = displayNavArrows;
        browser.edgesForExtendedLayout = YES;
        browser.zoomPhotosToFill = YES;
        browser.enableGrid = enableGrid;
        browser.startOnGrid = startOnGrid;
        [browser setCurrentPhotoIndex:0];

    }
}
/*
- (void)wallpaperPreviewControllerDidCancel:(id)arg1 {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        
    }
}
- (void)wallpaperPreviewController:(id)arg1 didSelectImage:(id)arg2 {
    
}*/
%new 
- (void)buttonWasPressed {
    [self.navigationController pushViewController:browser animated:YES];
    [browser reloadData];
}
#pragma mark - MWPhotoBrowserDelegate ==============================
%new 
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return wallpapers.count;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < wallpapers.count)
        return [wallpapers objectAtIndex:index];
    return nil;
}
%new 
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (index < thumbs.count)
        return [thumbs objectAtIndex:index];
    return nil;
}
%new 
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}
%end

%hook WASettingsViewController
/*- (void)viewDidLoad {
    %orig;
}*/
- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    if (newSettings) {
        //    Class profileController = objc_getClass("ProfileViewController");
        //    ProfileViewController *requestPic = [[profileController alloc] init];
        //    ProfileViewController *profileController = [[objc_getClass("ProfileViewController") alloc] initWithProfileContollerDelegate:self];
        /*Class connectionStatusView = objc_getClass("WAConnectionStatusView");
         WAConnectionStatusView *conStatus = [[connectionStatusView alloc] init];*/
        WAConnectionStatusView *connectionStatus = MSHookIvar<WAConnectionStatusView *>(self, "_connectionStatusView");
        UILabel *statusLabel = MSHookIvar<UILabel *>(connectionStatus, "_statusLabel");
        
        settingsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+55)];
        [settingsView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:settingsView];
        
        netStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(100, 10, 120, 50) raised:YES];
        [netStatusButton setTitle:statusLabel.text forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateNormal];
        [netStatusButton setTitleColor:statusLabel.textColor forState:UIControlStateHighlighted];
        [netStatusButton addTarget:self action:@selector(updateConnectionStatus) forControlEvents:UIControlEventTouchUpInside];
        netStatusButton.backgroundColor = [UIColor whiteColor];
        netStatusButton.tapCircleColor = [UIColor clearColor];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        netStatusButton.rippleFromTapLocation = NO;
        netStatusButton.rippleBeyondBounds = YES;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        aboutButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 75, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [aboutButton setTitle:@"حول" forState:UIControlStateNormal];
        } else {
            [aboutButton setTitle:@"About" forState:UIControlStateNormal];
        }
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [aboutButton addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
        aboutButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        aboutButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // aboutButton.cornerRadius = aboutButton.frame.size.width / 2;
        aboutButton.rippleFromTapLocation = YES;
        aboutButton.rippleBeyondBounds = NO;
        // aboutButton.tapCircleDiameter = MAX(aboutButton.frame.size.width, aboutButton.frame.size.height) * 1.3;
        
        tellButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [tellButton setTitle:@"أخبر صديقك" forState:UIControlStateNormal];
        } else {
            [tellButton setTitle:@"Tell a Friend" forState:UIControlStateNormal];
        }
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [tellButton addTarget:self action:@selector(inviteAction) forControlEvents:UIControlEventTouchUpInside];
        tellButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        tellButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        profileButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 130, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [profileButton setTitle:@"الملف الشخصي" forState:UIControlStateNormal];
        } else {
            [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
        }
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [profileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [profileButton addTarget:self action:@selector(viewProfileAction) forControlEvents:UIControlEventTouchUpInside];
        profileButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        profileButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        tellButton.rippleFromTapLocation = YES;
        tellButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        accountButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(15, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [accountButton setTitle:@"الحساب" forState:UIControlStateNormal];
        } else {
            [accountButton setTitle:@"Account" forState:UIControlStateNormal];
        }
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [accountButton addTarget:self action:@selector(viewAccountAction) forControlEvents:UIControlEventTouchUpInside];
        accountButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        accountButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        accountButton.rippleFromTapLocation = YES;
        accountButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        chSettingsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 190, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [chSettingsButton setTitle:@"إعدادات لامحادثة" forState:UIControlStateNormal];
        } else {
            [chSettingsButton setTitle:@"Chat Settings" forState:UIControlStateNormal];
        }
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [chSettingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [chSettingsButton addTarget:self action:@selector(chatSettingsAction) forControlEvents:UIControlEventTouchUpInside];
        chSettingsButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        chSettingsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        chSettingsButton.rippleFromTapLocation = YES;
        chSettingsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        notifiButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(177, 250, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [notifiButton setTitle:@"الاشعارات" forState:UIControlStateNormal];
        } else {
            [notifiButton setTitle:@"Notifications" forState:UIControlStateNormal];
        }
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [notifiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [notifiButton addTarget:self action:@selector(notificationsAction) forControlEvents:UIControlEventTouchUpInside];
        notifiButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        notifiButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        notifiButton.rippleFromTapLocation = YES;
        notifiButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        sysStatusButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(95, 310, 130, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [sysStatusButton setTitle:@"حالة النظام" forState:UIControlStateNormal];
        } else {
            [sysStatusButton setTitle:@"System Status" forState:UIControlStateNormal];
        }
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sysStatusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [sysStatusButton addTarget:self action:@selector(systemStatusAction) forControlEvents:UIControlEventTouchUpInside];
        sysStatusButton.backgroundColor = [UIColor colorWithRed:0.3 green:0 blue:1 alpha:1];
        sysStatusButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        sysStatusButton.rippleFromTapLocation = YES;
        sysStatusButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        clearChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(75, 370, 170, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [clearChatsButton setTitle:@"حذف جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [clearChatsButton setTitle:@"Clear All Conversations" forState:UIControlStateNormal];
        }
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [clearChatsButton addTarget:self action:@selector(clearChatHistoryAction) forControlEvents:UIControlEventTouchUpInside];
        clearChatsButton.backgroundColor = [UIColor redColor];
        clearChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        clearChatsButton.rippleFromTapLocation = YES;
        clearChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        archiveChatsButton = [[BFPaperButton alloc] initWithFrame:CGRectMake(65, 430, 190, 40) raised:YES];
        if ([WAELANGUAGE isEqualToString:@"ar"]) {
            [archiveChatsButton setTitle:@"أرشفة جميع المحادثات" forState:UIControlStateNormal];
        } else {
            [archiveChatsButton setTitle:@"Archive All Conversations" forState:UIControlStateNormal];
        }
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [archiveChatsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [archiveChatsButton addTarget:self action:@selector(archiveOrUnarchiveAllChatsAction) forControlEvents:UIControlEventTouchUpInside];
        archiveChatsButton.backgroundColor = [UIColor brownColor];
        archiveChatsButton.tapCircleColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:0.6];  // Setting this color overrides "Smart Color".
        // tellButton.cornerRadius = tellButton.frame.size.width / 2;
        archiveChatsButton.rippleFromTapLocation = YES;
        archiveChatsButton.rippleBeyondBounds = NO;
        // tellButton.tapCircleDiameter = MAX(tellButton.frame.size.width, tellButton.frame.size.height) * 1.3;
        
        
        // [settingsView addSubview:myImage];
        [settingsView addSubview:netStatusButton];
        [settingsView addSubview:aboutButton];
        [settingsView addSubview:tellButton];
        [settingsView addSubview:profileButton];
        [settingsView addSubview:accountButton];
        [settingsView addSubview:chSettingsButton];
        [settingsView addSubview:notifiButton];
        [settingsView addSubview:sysStatusButton];
        [settingsView addSubview:clearChatsButton];
        [settingsView addSubview:archiveChatsButton];
    } else {
        %orig;
    }
}
%new
- (void)profileViewControllerDidFinish:(ProfileViewController *)arg1 {
    
}
//%new
//- (void)incomingWAEProfileImage:(NSNotification *)notification {
//    myImage = [[notification userInfo] valueForKey:@"WAEProImage"];
//
//    NSLog(@"Received Notification - myImage = %@", myImage);
//
//    [settingsView addSubview:myImage];
//}

%end

%hook WAListsViewController
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (newSettings) {
        if (editing) {
            editButton = [self navigationItem].rightBarButtonItem;
            
            deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"DeleteAll" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAllPressed)];
            
            [[self navigationItem] setLeftBarButtonItem:deleteButton animated:YES];
        } else {
            [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
            [[self navigationItem] setBackBarButtonItem:editButton];
        }
    } else {
        %orig;
    }
    %orig;
}
%new
- (void)deleteAllPressed {
    //NSFetchedResultsController *fetchedResultsController = MSHookIvar<NSFetchedResultsController *>(self, "_fetchedResultsController");
    UITableView *tableView = MSHookIvar<UITableView *>(self, "_tableView");
    WAChatSession *activeList = MSHookIvar<WAChatSession *>(self, "_activeList");
    NSLog(@"********ContactJID ****** %@",activeList.contactJID);
    //fetchedResultsController.fetchRequest.predicate = [NSPredicate  predicateWithValue:NO];
    // [fetchedResultsController performFetch:nil];
    [self deleteExistingList:activeList.contactJID];
    [self setEditing:NO animated:YES];
    [tableView reloadData];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Delete Lists" message:@"Doesn't work probably yet :D" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
    [alertView show];
}
%end

// Server Properties
%hook WAServerProperties
+ (BOOL)isAudioSharingEnabled {
    if (unlimitedMedia) {
        BOOL r = YES;
        return r;
    } else {
        return %orig;
    }
}

+ (unsigned int)maxGroupSubjectLength {
    if (unlimitedSubjects) {
        unsigned int r = 300;
        return r;
    } else {
        return %orig;
    }
}
+ (unsigned long long)maxMediaSize {
    if (unlimitedMedia) {
        unsigned long long r = 2006777216;
        return r;
    } else {
        return %orig;
    }
}

+ (BOOL)isVOIPEnabled {
    return YES;
}

+ (BOOL)shouldQueryVersion:(id)arg1 {
    return NO;
}

%end

#pragma mark - Select All

%hook PeopleViewController

-(void)viewDidLoad {
    %orig;
    if (bcSelectAll) {
        UIToolbar *toolbarBottom = MSHookIvar<UIToolbar *>(self, "_toolbarBottom");
        UIBarButtonItem *buttonSelectAll = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectAll");
        UIBarButtonItem *buttonSelectDone = MSHookIvar<UIBarButtonItem *>(self, "_buttonSelectDone");
        UIBarButtonItem *buttonCancel = MSHookIvar<UIBarButtonItem *>(self, "_buttonCancel");
        flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        buttonSelectDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingAction:)];
        buttonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
        
        NSArray* buttons = [NSArray arrayWithObjects:flexibleSpace, buttonCancel, flexibleSpace, buttonSelectAll, flexibleSpace, buttonSelectDone, flexibleSpace, nil];
        [toolbarBottom setItems:buttons animated:NO];
        
    } else {
        %orig;
    }
}
%end

#pragma mark - Show Keyboard

%hook ChatListViewController
- (id)startChatWithSession:(id)arg1 highlightedMessage:(id)arg2 activateKeyboard:(BOOL)arg3 pushImmediately:(BOOL)arg4 animated:(BOOL)arg5 {
    if (showKeyboard) {
        arg3 = YES;
        return %orig(arg1, arg2, arg3, arg4, arg5);
    } else {
        return %orig;
    }
}
%end

#pragma mark - image maximum

%hook WAMediaPickerController

- (int)maximumSelectionCount {
    if (unlimitedPhotos) {
        return 87465124;
    } else {
        return %orig;
    }
}

- (BOOL)allowsMultipleSelection {
    if (unlimitedPhotos) {
        return %orig;
    } else {
        return %orig;
    }
}
%end

#pragma mark - Profile Pic

%hook WAPhotoMoveAndScaleViewController

- (BOOL)mustScaleToFill {
    if (profilePic) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)setMinimumWidth:(float )minimumWidth {
    %log;
    float  r = 640.0f;
    minimumWidth = r;
    %orig(minimumWidth);
}
- (float )minimumWidth {
    %log;
    float  r = 640.0f;
    return r;
}
%end

#pragma mark - OpenLink

%hook UIApplication
- (BOOL)openURL:(NSURL *)url
{
    if (openLink) {
        if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            return %orig;
        } else if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID] || [[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
            if ([[url absoluteString] hasPrefix:@"http"]) {
                [BrowseInAppViewController eventTriggered:url];
                return YES;
            } else {
                %orig;
            }
        }
        
    } else {
        return %orig;
    }
}
%end

#pragma mark - LastSeen Share Menu TextWalk

%hook XMPPConnection

- (id)createPresence:(unsigned int)arg1 withNickname:(id)arg2 {
    %log;
    
    if (lastSeen) {
        return %orig(0, arg2);
    } else {
        return %orig;
    }
}
- (id)createPresenceWithType:(int)fp8 nickname:(id)fp12 {
    %log;
    
    if (lastSeen) {
        return %orig(0, fp12);
    } else {
        return %orig;
    }
}

- (void)changeChatState:(unsigned int)arg1 forJID:(id)arg2 {
    if (disableWrite) {
        %orig(0, arg2);
    } else {
        %orig;
    }
}
- (void)sendPresenceWithNickname:(id)arg1 {
    %log;

    if (lastSeen) {
        return;
    } else {
        return %orig;
    }
}
- (void)sendDeliveryReceiptsForChatMessages:(id)arg1 completion:(id)arg2 {
    if (readMark) {
        %orig(nil, nil); // <-- disabled read for ChatMessages
    } else {
        return %orig;
    }
}

- (void)sendDeliveryReceiptsForMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendRReceiptsForChatMessages:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
- (void)sendPlayedReceiptForMessage:(id)arg1 {
    if (readMark) {
        return; // <-- disabled read for Stanzas
    } else {
        return %orig;
    }
}
%end

%hook XMPPClient

- (void)setLastPresence:(int)fp8 {
    if (lastSeen) %orig(0);
    else %orig;
}
- (int)lastPresence {
    if (lastSeen) return 0;
    else return %orig;
}
%end

%hook ChatViewController

- (void)showQuickCamera {
    if (hideCamera) {
        return;
    } else {
        %orig;
    }
}

- (void)viewDidAppear:(BOOL)arg1 {
    %orig;
    UITableView *tableViewMessages = MSHookIvar<UITableView *>(self, "_tableViewMessages");
    BYQuickShotView *quickShotView = [[BYQuickShotView alloc] init];
    WAChatBarManager *chatBarManager = MSHookIvar<WAChatBarManager *>(self, "_chatBarManager");
    
     [[NSNotificationCenter defaultCenter] addObserver:chatBarManager selector:@selector(hideKeyboard) name:@"keyboardWillHide" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(emailSingleMediaFromMessage:) name:@"emailSingleMediaFromMessage" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSingleMediaForwardPicker) name:@"showForwardViaWhatsApp" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(retrySendingMessageFromCellData:) name:@"retrySendingMessageFromCellData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteMessagesFromCellData:) name:@"deleteMessagesFromCellData" object:nil];
    if (textWALK) {
        if (self.isViewLoaded && self.view.window) {
            // self is visible
            %orig;
            quickShotView.frame = tableViewMessages.frame; // [[UIScreen mainScreen] bounds];
            //[[UIScreen mainScreen] bounds]; //CGRectMake(190, 290, 120, 160);
            quickShotView.hidden = NO;
            tableViewMessages.backgroundView = quickShotView;
            //tableViewMessages.backgroundColor = [self grabBGColorColor:chatbgColor];
            
        } else {
            %orig;
            quickShotView.hidden = YES;
        }
    } else {
        %orig;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int)arg1 {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}
- (BOOL)shouldAutorotate {
    if (textWALK) {
        return NO;
    } else {
        return %orig;
    }
}

- (void)alertButtonTappedInCell:(id)arg1 {
    if (shareStyle) {
        shareStyle = NO;
        %orig;
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail = @"Forward via Email";
    NSString *FDWhats = @"Forward via WhatsApp";

    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keyboardWillHide" object: nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"emailSingleMediaFromMessage" object: nil];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keyboardWillHide" object: nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showForwardViaWhatsApp" object: nil];
    }
    if  ([buttonTitle isEqualToString:@"Delete"]) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteMessagesFromCellData" object: nil];
        
    }
    if ([buttonTitle isEqualToString:@"Retry Send Message"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"retrySendingMessageFromCellData" object: nil];
        
    }
}
- (void)chatBarManagerWantsToAttachMedia:(id)arg1 {
    // Works
    if (shareStyle) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keyboardWillHide" object: nil];
        [self showList];
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)showList {
    
    plist = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    optionAB = [((NSNumber*)[plist valueForKey:@"optAB"]) integerValue];
    [self grabOption:optionAB];
    
}

%new(v@:@@)
-(void)grabOption:(NSInteger)optionNM {
    switch (optionNM) {
        case 0:
            NSLog(@"**[ WAEnhancer ] ******** LeveyPop");
            [self openLeveyPop];
            break;
        case 1:
            NSLog(@"**[ WAEnhancer ] ******** CFShare");
            [self openCFShare];
            break;
        case 2:
            NSLog(@"**[ WAEnhancer ] ******** AAShare");
            [self openRNGridMenu];
            break;
        default:
            break;
    }
}

%new(v@:@@)
-(void)openLeveyPop {
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"صورة او فيديو",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"صورة بالالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"فيديو من الالبوم",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"مشاركة الموقع",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"مشاركة جهة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"اخر صورة",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"تعديل الصورة",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"مشاركة موسيقي",@"text", nil],
               
               nil];
    } else {
        options = [NSArray arrayWithObjects:
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:takepimage],@"img",@"Photo or Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:photoimage],@"img",@"Existing Photo",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:videoimage],@"img",@"Existing Video",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:locatimage],@"img",@"Share Location",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:contaimage],@"img",@"Share Contact",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:lastimage],@"img",@"Last Image",@"text", nil],
               [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:editimage],@"img",@"Filter Image",@"text", nil], [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageWithContentsOfFile:musicimage],@"img",@"Send Music",@"text", nil],
               
               nil];
    }
    
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"WAEnhancer" options:options];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];
}

%new(v@:@@)
-(void)openCFShare {
    shareCircleView = [[CFShareCircleView alloc] init];
    shareCircleView.delegate = self;
    [shareCircleView show];
}

%new(v@:@@)
-(void)openRNGridMenu {
    NSInteger numberOfOptions =  8;
    NSString *takepimage = @"/Library/Application Support/WAEnhancer/photovideo.png";
    NSString *photoimage = @"/Library/Application Support/WAEnhancer/photo.png";
    NSString *videoimage = @"/Library/Application Support/WAEnhancer/video.png";
    NSString *locatimage = @"/Library/Application Support/WAEnhancer/location.png";
    NSString *contaimage = @"/Library/Application Support/WAEnhancer/contact.png";
    NSString *musicimage = @"/Library/Application Support/WAEnhancer/music.png";
    NSString *lastimage = @"/Library/Application Support/WAEnhancer/lastimage.png";
    NSString *editimage = @"/Library/Application Support/WAEnhancer/editimage.png";
    //NSString *doodleimage = @"/Library/Application Support/WAEnhancer/doodleimage.png";
    NSArray *items;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"صورة او فيديو"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"صورة من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"فيديو من الالبوم"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"مشاركة الموقع"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"مشاركة جهة"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"اخر صورة"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"تعديل الصورة"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"مشاركة صوتيات"],
                       ];
    } else {
        items = @[         [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:takepimage] title:@"Photo or Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:photoimage] title:@"Existing Photo"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:videoimage] title:@"Existing Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:locatimage] title:@"Share Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:contaimage] title:@"Share Contact"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:lastimage] title:@"Last Image"],
                       
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:editimage] title:@"Filter Image"],
                       
                       /*[[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:doodleimage] title:@"Doodle Image"]*//*,*/
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageWithContentsOfFile:musicimage] title:@"Share Music"],
                       ];
    }
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    av.itemFont = [UIFont boldSystemFontOfSize:12];
    av.backgroundColor = [UIColor whiteColor];
    av.itemTextColor = [UIColor blackColor];
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark -

#pragma mark - LeveyPopListView delegates
%new(v@:@@)
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog (@"You have selected %@",options[anIndex]);
    switch (anIndex) {
        case 0: {
            NSLog(@"**[ WAEnhancer ] Result: Image Video");
            [self showCamera];
            break;
        }
        case 1: {
            NSLog(@"**[ WAEnhancer ] Result: Image");
            [self showImagePicker];
            break;
        }
        case 2: {
            NSLog(@"**[ WAEnhancer ] Result: Video");
            [self showVideoPicker];
            break;
        }
        case 3: {
            NSLog(@"**[ WAEnhancer ] Result: ShareLocation");
            [self presentShareLocationController];
            break;
        }
        case 4: {
            NSLog(@"**[ WAEnhancer ] Result: VCardPersonPicker");
            [self showVCardPersonPicker];
            break;
        }
        case 5: {
            NSLog(@"**[ WAEnhancer ] Result: LastImage");
            [self sendLastImage];
            break;
        }
        case 6: {
            NSLog(@"**[ WAEnhancer ] Result: filterImage");
            [self filterImage];
            break;
        }
        case 7: {
            NSLog(@"**[ WAEnhancer ] Result: Music");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
            break;
        }
        default:
            NSLog(@"**[ WAEnhancer ] Result: not sent");
            break;
    }
}

%new(v@:@@)
- (void)leveyPopListViewDidCancel {
    NSLog(@"**[ WAEnhancer ] You have cancelled");
}

#pragma mark CFShareCircleView

%new(v@:@@)
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer {
    NSLog(@"**[ WAEnhancer ] Selected sharer: %@", sharer.name);
    if ([sharer.name isEqualToString:@"Ph&Vid"]) {
        [self showCamera];
    }
    if ([sharer.name isEqualToString:@"Photo"]) {
        [self showImagePicker];
    }
    if ([sharer.name isEqualToString:@"Video"]) {
        [self showVideoPicker];
    }
    if ([sharer.name isEqualToString:@"Location"]) {
        [self presentShareLocationController];
    }
    if ([sharer.name isEqualToString:@"Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([sharer.name isEqualToString:@"LSImage"]) {
        [self sendLastImage];
    }
    if ([sharer.name isEqualToString:@"FiImage"]) {
        [self filterImage];
    }
    if ([sharer.name isEqualToString:@"Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)shareCircleCanceled:(NSNotification *)notification{
    NSLog(@"**[ WAEnhancer ] Share circle view was canceled.");
}

#pragma mark - RNGridMenuDelegate
%new(v@:@@)
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex  {
if ([item.title isEqualToString:@"Photo or Video"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"Existing Photo"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"Existing Video"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"Share Location"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"Share Contact"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"Last Image"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"Filter Image"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"Share Music"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
    if ([item.title isEqualToString:@"صورة او فيديو"]) {
        [self showCamera];
    }
    if ([item.title isEqualToString:@"صورة من الالبوم"]) {
        [self showImagePicker];
    }
    if ([item.title isEqualToString:@"فيديو من الالبوم"]) {
        [self showVideoPicker];
    }
    if ([item.title isEqualToString:@"مشاركة الموقع"]) {
        [self presentShareLocationController];
    }
    if ([item.title isEqualToString:@"مشاركة جهة"]) {
        [self showVCardPersonPicker];
    }
    if ([item.title isEqualToString:@"اخر صورة"]) {
        [self sendLastImage];
    }
    if ([item.title isEqualToString:@"تعديل الصورة"]) {
        [self filterImage];
    }
    /*if ([item.title isEqualToString:@"Doodle Image"]) {
     [self sendDoodle];
     }*/
    if ([item.title isEqualToString:@"مشاركة موسيقي"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"WAEMusic://"]];
    }
}

%new(v@:@@)
- (void)showAudio {
    // Music Picker
    // [WAEnhancerWindow eventTriggered];
}

%new(v@:@@)
- (void)sendLastImage {
    // send last image
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    // Enumerate just the photos and videos group by using ALAssetsGroupSavedPhotos.
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        // Within the group enumeration block, filter to enumerate just photos.
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        
        // Chooses the photo at the last index
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *alAsset, NSUInteger index, BOOL *innerStop) {
            
            // The end of the enumeration is signaled by asset == nil.
            if (alAsset) {
                ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                UIImage *latestPhoto = [UIImage imageWithCGImage:[representation fullScreenImage]];
                
                // Stop the enumerations
                *stop = YES; *innerStop = YES;
                
                // Do something interesting with the AV asset.
                [self sendImage:latestPhoto caption:@"WAEnhancer - LastImage"];
            }
        }];
    } failureBlock: ^(NSError *error) {
        // Typically you should handle an error more gracefully than this.
        NSLog(@"**[ WAEnhancer ] No groups");
    }];
}

%new(v@:@@)
- (void)filterImage {
    
    CustomImagePickerController *picker = [[CustomImagePickerController alloc] init];
    [picker setIsSingle:YES];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setCustomDelegate:self];
    [self presentViewController:picker animated:YES completion:NULL];
}

%new(v@:@@)
- (void)sendDoodle {
    /*
     WDoodleViewController *doodleController = [[WDoodleViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:doodleController];
     navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
     
     [self presentViewController:navigationController animated:YES completion:NULL];*/
}
#pragma mark - When finish
%new(v@:@@)
- (void)cameraPhoto:(UIImage *)image  //选择完图片
{
    /*
     ImageFilterProcessViewController *fitler = [[ImageFilterProcessViewController alloc] init];
     [fitler setDelegate:self];
     fitler.currentImage = image;
     [self presentViewController:fitler animated:YES completion:NULL];*/
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [self presentViewController:editor animated:YES completion:nil];
}

%new(v@:@@)
- (void)imageFitlerProcessDone:(UIImage *)image {
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [self sendImage:image caption:@"WAEnhancer - Filterd Image"];
}

%new(v@:@@)
- (void)imageFitlerProcessClose {
    [self sendImage:nil caption:nil];
}

#pragma mark- CLImageEditor delegate

%new(v@:@@)
- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
    [editor dismissViewControllerAnimated:YES completion:^{
        [self sendImage:image caption:@"WAEnhancer - Edited image"];
    }];
}

- (BOOL)showKeyboardOnAppear {
    if (showKeyboard) {
        return YES;
    } else {
        return NO;
    }
}
%end

#pragma mark - More options for Media
%hook WAMediaViewController
- (void)showMediaActions:(id)arg1 {
    
    //NSLog (@"**********WAEnhancer************* %@", self.currentMedia.path);
    //NSLog (@"**********WAEnhancer************* %d", self.currentMedia.type);
    //Action Sheet
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *actionSheetTitle = @""; //Action Sheet Title
    //Action Sheet Button Titles
           NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }


    //UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    //NSURL *outURL = [NSURL fileURLWithPath:self.currentMedia.path];
    if (mediaOptions) {
        if ([currentMessage.messageType intValue] == 1) {
            //Photos
            NSLog (@"**********WAEnhancer*************PHOTOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHPhotos, SVImage, ASContact, SETGroup, SETProfile, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 2) {
            //Videos
            NSLog (@"**********WAEnhancer*************VIDEOS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SHVideos, SVVideo, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        } else if ([currentMessage.messageType intValue] == 3) {
            //Musics
            NSLog (@"**********WAEnhancer*************MUSICS");
            UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                          initWithTitle:actionSheetTitle
                                          delegate:self
                                          cancelButtonTitle:cancelTitle
                                          destructiveButtonTitle:nil
                                          otherButtonTitles:SVMusic, FDEmail, FDWhats, nil];
            
            [actionSheet showInView:self.view];
            
        }
    } else {
        %orig;
    }
}

%new(v@:@@)
- (void)saveToMusicLibrary {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *musicPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:musicPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************MUSICS URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Music pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}

%new(v@:@@)
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //Get the name of the current pressed button
    
    NSString *FDEmail;
    NSString *FDWhats;
    NSString *SVVideo;
    NSString *SVImage;
    NSString *ASContact;
    NSString *SETProfile;
    NSString *SVMusic;
    NSString *SETGroup;
    NSString *cancelTitle;
    NSString *SHPhotos;
    NSString *SHVideos;
    if ([WAELANGUAGE isEqualToString:@"ar"]) {
       FDEmail = @"مشاركة بواسطة الايميل";
       FDWhats = @"مشاركة بواسطة الواتس اب";
       SVVideo = @"مشاركة الفيديو";
       SVImage = @"حفظ الصورة";
       ASContact = @"تعين لجهة اتصال";
       SETProfile = @"تعين كا صورة شخصية";
       SVMusic = @"مشاركة الصوتيات";
       SETGroup = @"تعين للجروب";
       cancelTitle = @"الغاء";
       SHPhotos = @"مشاركة الصورة";
       SHVideos = @"مشاركة الفيديو";
    } else {
       FDEmail = @"Forward via Email";
       FDWhats = @"Forward via WhatsApp";
       SVVideo = @"Save Video";
       SVImage = @"Save Image";
       ASContact = @"Assign to Contact";
       SETProfile = @"Set as Profile Photo";
       SVMusic = @"Share Music";
       SETGroup = @"Assign to Group";
       cancelTitle = @"Cancel";
       SHPhotos = @"Share Photo";
       SHVideos = @"Share Video";
    }

    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:FDEmail]) {
        NSLog(@"**[ WAEnhancer ] Email pressed");
        [self forwardMediaViaEmail];
    }
    if ([buttonTitle isEqualToString:FDWhats]) {
        NSLog(@"**[ WAEnhancer ] Whats pressed");
        [self showPersonPickerForMediaForwardViaWhatsApp];
    }
    if ([buttonTitle isEqualToString:SVVideo]) {
        NSLog(@"**[ WAEnhancer ] Video pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        NSURL *sourceURL = [NSURL fileURLWithPath:photoPath];
        NSURLSessionTask *download = [[NSURLSession sharedSession] downloadTaskWithURL:sourceURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
            NSURL *tempURL = [documentsURL URLByAppendingPathComponent:[sourceURL lastPathComponent]];
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:tempURL error:nil];
            UISaveVideoAtPathToSavedPhotosAlbum(tempURL.path, nil, NULL, NULL);
        }];
        [download resume];
    }
    if ([buttonTitle isEqualToString:SVImage]) {
        NSLog(@"**[ WAEnhancer ] Image pressed");
        WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
        NSString *photoPath = currentMessage.mediaPath;
        UIImage *image = [UIImage imageWithContentsOfFile:photoPath];
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    if ([buttonTitle isEqualToString:ASContact]) {
        NSLog(@"**[ WAEnhancer ] Contact pressed");
        [self assignImageToContact];
    }
    if ([buttonTitle isEqualToString:SETProfile]) {
        NSLog(@"**[ WAEnhancer ] Profile pressed");
        [self setProfilePhoto];
    }
    if ([buttonTitle isEqualToString:SETGroup]) {
        NSLog(@"**[ WAEnhancer ] Group pressed");
        [self assignCurrentImageToGroup];
    }
    if ([buttonTitle isEqualToString:SVMusic]) {
        NSLog(@"**[ WAEnhancer ] Music pressed");
        [self saveToMusicLibrary];
    }
    if ([buttonTitle isEqualToString:SHPhotos]) {
        [self sharePhotosTo];
    }
    if ([buttonTitle isEqualToString:SHVideos]) {
        [self shareVideosTo];
    }
}
%new(v@:@@)
- (void)sharePhotosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *photoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:photoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Photo URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Photo pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%new(v@:@@)
- (void)shareVideosTo {
    WAMessage *currentMessage = MSHookIvar<WAMessage *>(self, "_currentMessage");
    NSString *videoPath = currentMessage.mediaPath;
    NSURL *outURL = [NSURL fileURLWithPath:videoPath];
    UIBarButtonItem *actionButton = MSHookIvar<UIBarButtonItem *>(self, "_actionButton");
    
    NSArray *activitesApp;
    NSArray *activitesItem;
    //NSLog (@"**********WAEnhancer*************Video URL: %@", outURL);
    NSLog(@"**[ WAEnhancer ] Videos pressed");
    EGYOpenInActivity *EgyOpenIN = [[EGYOpenInActivity alloc] initWithView:self.view andBarButtonItem:actionButton];
    activitesApp = @[EgyOpenIN];
    activitesItem = @[outURL];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activitesItem applicationActivities:activitesApp];
    EgyOpenIN.superViewController = activityController;
    [self presentViewController:activityController animated:YES completion:^{}];
}
%end

#pragma mark - Test Messages Color & URL Color

%hook TextMessage
- (void)setUrlColor:(id)arg1 {
    
    if (urlColor == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (urlColor == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (urlColor == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (urlColor == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (urlColor == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (urlColor == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (urlColor == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (urlColor == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (urlColor == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (urlColor == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (urlColor == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (urlColor == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (urlColor == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (urlColor == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}
- (void)setTextColor:(id)arg1 {
    
    if (colorPrefs == 0) {
        arg1 = whiteColor;
        %orig(arg1);
    }
    else if (colorPrefs == 1) {
        arg1 = blueColor;
        %orig(arg1);
    }
    else if (colorPrefs == 2) {
        arg1 = greenColor;
        %orig(arg1);
    }
    else if (colorPrefs == 3) {
        arg1 = blackColor;
        %orig(arg1);
    }
    else if (colorPrefs == 4) {
        arg1 = brownColor;
        %orig(arg1);
    }
    else if (colorPrefs == 5) {
        arg1 = purpleColor;
        %orig(arg1);
    }
    else if (colorPrefs == 6) {
        arg1 = redColor;
        %orig(arg1);
    }
    else if (colorPrefs == 7) {
        arg1 = orangeColor;
        %orig(arg1);
    }
    else if (colorPrefs == 8) {
        arg1 = darkGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 9) {
        arg1 = lightGrayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 10) {
        arg1 = grayColor;
        %orig(arg1);
    }
    else if (colorPrefs == 11) {
        arg1 = cyanColor;
        %orig(arg1);
    }
    else if (colorPrefs == 12) {
        arg1 = yellowColor;
        %orig(arg1);
    }
    else if (colorPrefs == 13) {
        arg1 = magentaColor;
        %orig(arg1);
    }
    else if (colorPrefs == 14) {
        arg1 = clearColor;
        %orig(arg1);
    }
}

%end

#pragma mark - Incress Status Length
%hook StatusEditController
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (unlimitedStatus) {
        
        return textView.text.length + (text.length - range.length) <= 256;
    } else {
        return %orig;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    //UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
    if (unlimitedStatus) {
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}

- (void)updateNavigationBar {
    if (unlimitedStatus) {
        UITextView *textView = MSHookIvar<UITextView *>(self, "_textView");
        NSString *titleFormatString = @"Your Status (%d)";
        self.title = [NSString stringWithFormat:titleFormatString, textView.text.length];
    } else {
        %orig;
    }
}
%end



#pragma mark - Incress Group Length
%hook WAGroupSubjectEditController
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (unlimitedSubjects) {
        
        NSUInteger oldLength = [textField.text length];
        NSUInteger replacementLength = [string length];
        NSUInteger rangeLength = range.length;
        
        NSUInteger newLength = oldLength - rangeLength + replacementLength;
        
        BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
        
        //return newLength <= MAXLENGTH || returnKey;
        
    } else {
        return %orig;
    }
}
- (void)updateCharCount {
    if (unlimitedSubjects) {
        %orig;
        UITextField *textField = MSHookIvar<UITextField *>(self, "_textField");
        UILabel *labelCharCount = MSHookIvar<UILabel *>(self, "_labelCharCount");
        NSString *labelString = @"%d";
        labelCharCount.text = [NSString stringWithFormat:labelString, [textField.text length]];
    } else {
        %orig;
    }
}
%end

%hook WAChatBar
- (void)layoutSubviews {
    %orig;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    UIButton *cameraButton = MSHookIvar<UIButton *>(self, "_cameraButton");
    UIImageView *imageDiv = MSHookIvar<UIImageView *>(self, "_dividerImageView");
    UIView *inBox = MSHookIvar<UIView *>(self, "_inputBoxView");
    UITextView *inTextView = MSHookIvar<UITextView *>(self, "_inputTextView");
    BOOL isActive = [inTextView isFirstResponder];
    if (hideCamera) {
        [cameraButton removeFromSuperview];
        [imageDiv removeFromSuperview];
        if(orientation == 0) {
            //Default orientation
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationPortrait) {
            //Do something if the orientation is in Portrait
            [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 230, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 230, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeLeft) {
            // Do something if Left
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        } else if(orientation == UIInterfaceOrientationLandscapeRight) {
            //Do something if right
            [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
            [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            if (![inTextView.text isEqualToString:@""]) {
                %orig;
            } else {
                [inBox setFrame:CGRectMake(41, 8.5, 474, 26)];
                [inTextView setFrame:CGRectMake(41, 9.5, 474, 26)];
            }
        }
    } else {
        %orig;
    }
}
%end
%hook WhatsAppAppDelegate
- (void)presentHelperScreenIfNecessary {
   return;
}
%end
%end

%group SBWARead
%hook SBBulletinObserverViewController
//- (void)clearSection:(SBNotificationsSectionInfo *)section {
//  if (readMark) {
//      if ([section.identifier isEqualToString:WHATSAPP_ID] || [section.identifier isEqualToString:WHATSAPP1_ID] || [section.identifier isEqualToString:WHATSAPP2_ID] || [section.identifier isEqualToString:WHATSAPP3_ID] || [section.identifier isEqualToString:WHATSAPP4_ID] || [section.identifier isEqualToString:WHATSAPP5_ID]) {
//            %orig();
//          // Getting icon.
//          SBIconController *_iconController = [%c(SBIconController) sharedInstance];
//          SBIconModel *_iconModel = [_iconController model];
//          SBIcon *_currentIcon = [_iconModel expectedIconForDisplayIdentifier:WHATSAPP_ID];
//          // "Removing" badge by setting it to 0.
//          [_currentIcon setBadge:[NSNumber numberWithInt:0]];
//      } else {
//          // Remove section from NC.
//          %orig();
//      }
//  } else {
//      %orig;
//  }
//}
- (void)observer:(id)observer addBulletin:(BBBulletinRequest *)bulletin forFeed:(int)feed {
    if (readMark) {
        if ([bulletin.section isEqualToString:WHATSAPP_ID] || [bulletin.section isEqualToString:WHATSAPP1_ID] || [bulletin.section isEqualToString:WHATSAPP2_ID] || [bulletin.section isEqualToString:WHATSAPP3_ID] || [bulletin.section isEqualToString:WHATSAPP4_ID] || [bulletin.section isEqualToString:WHATSAPP5_ID]) {
            subString = [bulletin.publisherBulletinID substringFromIndex:[bulletin.publisherBulletinID length] - 21];
            dataToWrite = [[NSString stringWithFormat:@"\r\n%@\r\n",subString] dataUsingEncoding:NSUTF8StringEncoding];
            docsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            path = [docsDirectory stringByAppendingPathComponent:@"WAEFile.txt"];
            //[dataToWrite writeToFile:path atomically:NO];
            NSError *error;
            content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            if(![fileManager fileExistsAtPath:path]) {
                [subString writeToFile:path atomically:NO encoding:NSUTF8StringEncoding error:&error];
                if (error) {
                    NSLog(@"*****ERROR********** : %@",[error localizedDescription]);
                }
            } else {
                NSFileHandle *myHandle = [NSFileHandle fileHandleForWritingAtPath:path];
                [myHandle seekToEndOfFile];
                NSRange range = [content rangeOfString:subString options:NSCaseInsensitiveSearch];
                NSLog(@"**************Found: %@", (range.location != NSNotFound) ? @"Yes" : @"No");
                if (range.location != NSNotFound) {
                    // your code
                    SBIcon *icon;
                    if (IS_OS_8_OR_LATER) {
                        isWAReadMarkEnabled = YES;
                        icon = (SBIcon *)[[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForBundleIdentifier:WHATSAPP_ID];
                    } else {
                        isWAReadMarkEnabled = YES;
                        icon = (SBIcon *)[[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForDisplayIdentifier:WHATSAPP_ID];
                    }                   
                    if(icon) {
                        [icon setBadge:@""];
                    }
                    return;
                } else {
                    isWAReadMarkEnabled = NO;
                    %orig;
                    [myHandle writeData:dataToWrite];
                    [myHandle closeFile];
                }
            }
        } else {
            %orig;
        }
    } else {
        %orig;
    }
}
%end

%hook SBBulletinBannerController
- (void)observer:(id)observer addBulletin:(BBBulletinRequest *)bulletin forFeed:(int)feed {
    if (readMark) {
        if ([bulletin.section isEqualToString:WHATSAPP_ID] || [bulletin.section isEqualToString:WHATSAPP1_ID] || [bulletin.section isEqualToString:WHATSAPP2_ID] || [bulletin.section isEqualToString:WHATSAPP3_ID] || [bulletin.section isEqualToString:WHATSAPP4_ID] || [bulletin.section isEqualToString:WHATSAPP5_ID]) {
            subString = [bulletin.publisherBulletinID substringFromIndex:[bulletin.publisherBulletinID length] - 21];
            dataToWrite = [[NSString stringWithFormat:@"\r\n%@\r\n",subString] dataUsingEncoding:NSUTF8StringEncoding];
            docsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            path = [docsDirectory stringByAppendingPathComponent:@"WAEFile.txt"];
            //[dataToWrite writeToFile:path atomically:NO];
            NSError *error;
            content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            if(![fileManager fileExistsAtPath:path]) {
                [subString writeToFile:path atomically:NO encoding:NSUTF8StringEncoding error:&error];
                if (error) {
                    NSLog(@"*****ERROR********** : %@",[error localizedDescription]);
                }
            } else {
                NSFileHandle *myHandle = [NSFileHandle fileHandleForWritingAtPath:path];
                [myHandle seekToEndOfFile];
                NSRange range = [content rangeOfString:subString options:NSCaseInsensitiveSearch];
                NSLog(@"**************Found: %@", (range.location != NSNotFound) ? @"Yes" : @"No");
                if (range.location != NSNotFound) {
                    // your code
                    SBIcon *icon;
                    if (IS_OS_8_OR_LATER) {
                        isWAReadMarkEnabled = YES;
                        icon = (SBIcon *)[[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForBundleIdentifier:WHATSAPP_ID];
                    } else {
                        isWAReadMarkEnabled = YES;
                        icon = (SBIcon *)[[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForDisplayIdentifier:WHATSAPP_ID];
                    }
                    
                    if(icon) {
                        [icon setBadge:@""];
                    }
                    return;
                } else {
                    isWAReadMarkEnabled = NO;
                    %orig;
                    [myHandle writeData:dataToWrite];
                    [myHandle closeFile];
                }
            }
        } else {
            %orig;
        }
    } else {
        %orig;
    }
}
%end

%hook SBLockScreenNotificationListController
- (void)observer:(id)observer addBulletin:(BBBulletinRequest *)bulletin forFeed:(int)feed {
    if (readMark) {
        if ([bulletin.section isEqualToString:WHATSAPP_ID] || [bulletin.section isEqualToString:WHATSAPP1_ID] || [bulletin.section isEqualToString:WHATSAPP2_ID] || [bulletin.section isEqualToString:WHATSAPP3_ID] || [bulletin.section isEqualToString:WHATSAPP4_ID] || [bulletin.section isEqualToString:WHATSAPP5_ID]) {
            subString = [bulletin.publisherBulletinID substringFromIndex:[bulletin.publisherBulletinID length] - 21];
            dataToWrite = [[NSString stringWithFormat:@"\r\n%@\r\n",subString] dataUsingEncoding:NSUTF8StringEncoding];
            docsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            path = [docsDirectory stringByAppendingPathComponent:@"WAEFile.txt"];
            //[dataToWrite writeToFile:path atomically:NO];
            NSError *error;
            content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            if(![fileManager fileExistsAtPath:path]) {
                [subString writeToFile:path atomically:NO encoding:NSUTF8StringEncoding error:&error];
                if (error) {
                    NSLog(@"*****ERROR********** : %@",[error localizedDescription]);
                }
            } else {
                NSFileHandle *myHandle = [NSFileHandle fileHandleForWritingAtPath:path];
                [myHandle seekToEndOfFile];
                NSRange range = [content rangeOfString:subString options:NSCaseInsensitiveSearch];
                NSLog(@"**************Found: %@", (range.location != NSNotFound) ? @"Yes" : @"No");
                if (range.location != NSNotFound) {
                    // your code
                    SBIcon *icon;
                    if (IS_OS_8_OR_LATER) {
                        isWAReadMarkEnabled = YES;
                        icon = (SBIcon *)[[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForBundleIdentifier:WHATSAPP_ID];
                    } else {
                        isWAReadMarkEnabled = YES;
                        icon = (SBIcon *)[[[%c(SBIconViewMap) homescreenMap] iconModel] applicationIconForDisplayIdentifier:WHATSAPP_ID];
                    }
                    
                    if(icon) {
                        [icon setBadge:@""];
                    }
                    return;
                } else {
                    isWAReadMarkEnabled = NO;
                    %orig;
                    [myHandle writeData:dataToWrite];
                    [myHandle closeFile];
                }
            }
        } else {
            %orig;
        }
    } else {
        %orig;
    }
}
%end

//%hook SBUserAgent
//- (void)setBadgeNumberOrString:(id)arg1 forApplicationWithID:(NSString *)arg2 {
//    if (readMark) {
//        if ([arg2 isEqualToString:WHATSAPP_ID] || [arg2 isEqualToString:WHATSAPP1_ID] || [arg2 isEqualToString:WHATSAPP2_ID] || [arg2 isEqualToString:WHATSAPP3_ID] || [arg2 isEqualToString:WHATSAPP4_ID] || [arg2 isEqualToString:WHATSAPP5_ID]) {
//            if (isWAReadMarkEnabled) {
//                return;
//            } else {
//                %orig;
//            }
//        } else {
//            %orig;
//        }
//    } else {
//        %orig;
//    }
//}
//%end
%end



// static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    
//     system("killall WhatsApp");
    
//     NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    
//     textWALK = [preferences[PREFERENCES_ENABLED_TEXTWALK_KEY] boolValue];
//     openLink = [preferences[PREFERENCES_ENABLED_OLINK_KEY] boolValue];
//     bcSelectAll = [preferences[PREFERENCES_ENABLED_SelectALL_KEY] boolValue];
//     unlimitedMedia = [preferences[PREFERENCES_ENABLED_UnlimitedMedia_KEY] boolValue];
//     unlimitedStatus = [preferences[PREFERENCES_ENABLED_UnlimitedListStatus_KEY] boolValue];
//     unlimitedSubjects = [preferences[PREFERENCES_ENABLED_UnlimitedSubjects_KEY] boolValue];
//     unlimitedPhotos = [preferences[PREFERENCES_ENABLED_UnlimitedPhotos_KEY] boolValue];
//     lastSeen = [preferences[PREFERENCES_ENABLED_LASTSEEN_KEY] boolValue];
//     shareStyle = [preferences[PREFERENCES_ENABLED_ShareStyle_KEY] boolValue];
//     mediaOptions = [preferences[PREFERENCES_ENABLED_MediaOPTIONS_KEY] boolValue];
//     profilePic = [preferences[PREFERENCES_ENABLED_ProfilePIC_KEY] boolValue];
//     colorPrefs = [((NSNumber *)[preferences valueForKey:PREFERENCES_FONTCOLOR_KEY]) integerValue];
//     urlColor = [((NSNumber *)[preferences valueForKey:PREFERENCES_URLCOLOR_KEY]) integerValue];
//     showKeyboard = [preferences[PREFERENCES_SHOWKEYBOARD_KEY] boolValue];
//     hideCamera = [preferences[PREFERENCES_HIDECAMERA_KEY] boolValue];
//     newSettings = [[preferences objectForKey:@"enSettings"]boolValue];
//     readMark = [preferences[PREFERENCES_ENABLED_READ_KEY] boolValue];
//     disableWrite = [preferences[kDisableWriteKey] boolValue];
//     //WhatsApp Version
//     WhatsApp = [preferences[PREFERENCES_ENABLED_WHATSAPP_KEY] boolValue];
//     WhatsApp1 = [preferences[PREFERENCES_ENABLED_WHATSAPP1_KEY] boolValue];
//     WhatsApp2 = [preferences[PREFERENCES_ENABLED_WHATSAPP2_KEY] boolValue];
//     WhatsApp3 = [preferences[PREFERENCES_ENABLED_WHATSAPP3_KEY] boolValue];
//     WhatsApp4 = [preferences[PREFERENCES_ENABLED_WHATSAPP4_KEY] boolValue];
//     WhatsApp5 = [preferences[PREFERENCES_ENABLED_WHATSAPP5_KEY] boolValue];
    
    
// }

%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)WAEnhancerInitPrefs, CFSTR(kPreferencesChanged), NULL, CFNotificationSuspensionBehaviorCoalesce);
    WAEnhancerInitPrefs();
    NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:@"/Library/MobileSubstrate/DynamicLibraries/WAEnhancerFix.dylib" error:nil];
        [fileManager removeItemAtPath:@"/Library/MobileSubstrate/DynamicLibraries/WAEnhancerFix.plist" error:nil];

        %init();
        NSDictionary *prefs = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
        WhatsApp = [prefs[PREFERENCES_ENABLED_WHATSAPP_KEY] boolValue];
        WhatsApp1 = [prefs[PREFERENCES_ENABLED_WHATSAPP1_KEY] boolValue];
        WhatsApp2 = [prefs[PREFERENCES_ENABLED_WHATSAPP2_KEY] boolValue];
        WhatsApp3 = [prefs[PREFERENCES_ENABLED_WHATSAPP3_KEY] boolValue];
        WhatsApp4 = [prefs[PREFERENCES_ENABLED_WHATSAPP4_KEY] boolValue];
        WhatsApp5 = [prefs[PREFERENCES_ENABLED_WHATSAPP5_KEY] boolValue];
        NSString *checkTHIS = @"".forward_slash.v.a.r.forward_slash.l.i.b.forward_slash.a.p.t.forward_slash.l.i.s.t.s.forward_slash.c.y.d.i.a.dot.a.r.a.b.i.a.n.c.y.d.i.a.dot.c.o.m.underscore.dot.underscore.P.a.c.k.a.g.e.s;
        // NSString *thisISIT = @"miNuIyqfufcces/PBO2UVoKL42dCtuL4ntEZvPeTkd/wf4xI+LM9rRCvDBRSKpP7sZyFP8/pYrXGZpDnzc5ozw==";
        // NSString *idDone = [AESCrypt decrypt:thisISIT password:@"64132138"];
        NSString *masarHaga1 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.dot.d.y.l.i.b;
        NSString *masarHaga2 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.w.a.r.e.a.d.dot.d.y.l.i.b;
        NSString *masarHaga3 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.N.e.w.dot.d.y.l.i.b;
        NSString *masarHaga4 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.C.o.l.o.r.dot.d.y.l.i.b;
        NSString *masarHaga5 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.N.e.w.S.e.t.t.i.n.g.s.dot.d.y.l.i.b;
        NSString *masarHaga6 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.C.h.a.t.P.r.o.t.e.c.t.i.o.n.dot.d.y.l.i.b;

        BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:checkTHIS];
        if (fileExists) {
            [[NSFileManager defaultManager] removeItemAtPath:masarHaga1 error:nil];
            [[NSFileManager defaultManager] removeItemAtPath:masarHaga2 error:nil];
            [[NSFileManager defaultManager] removeItemAtPath:masarHaga3 error:nil];
            [[NSFileManager defaultManager] removeItemAtPath:masarHaga4 error:nil];
            [[NSFileManager defaultManager] removeItemAtPath:masarHaga5 error:nil];
            [[NSFileManager defaultManager] removeItemAtPath:masarHaga6 error:nil];
            // UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Checker" message:@"ops sorry :'(" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
            //                 [alertView show];
        }
        NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
        if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
            %init(SBWARead);
        }
        if (WhatsApp) {
            if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP_ID]) {
                NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
                if ([version isEqualToString:@"2.11.8"]) {
                    %init(WHATSOLD);
                } else {
                    %init(WHATSNEW);
                }
                BOOL LastSeenOnline = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnline"];
                BOOL LastSeenOnlineDone = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnlineDone"];
                if (!LastSeenOnline) {
                    if ([iMasrok masroka] !=HELWAA) {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Checker" message:@"ops you have cracked version :'(" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                        [alertView show];

                        NSString *masarHaga1 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.dot.d.y.l.i.b;
                        NSString *masarHaga2 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.w.a.r.e.a.d.dot.d.y.l.i.b;
                        NSString *masarHaga3 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.N.e.w.dot.d.y.l.i.b;
                        NSString *masarHaga4 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.C.o.l.o.r.dot.d.y.l.i.b;
                        NSString *masarHaga5 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.N.e.w.S.e.t.t.i.n.g.s.dot.d.y.l.i.b;
                        NSString *masarHaga6 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.C.h.a.t.P.r.o.t.e.c.t.i.o.n.dot.d.y.l.i.b;

                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga1 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga2 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga3 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga4 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga5 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga6 error:nil];
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                    } else {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        if (!LastSeenOnlineDone) {
                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"@iMokhles" message:@"Thanks for purchase WAEnhancer, Hope you like it, and more comes with updates ;)" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                            [alertView show];
                            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnlineDone"];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        }
                    }
                }
            }
            
        }
        if (WhatsApp1) {
            if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP1_ID]) {
                NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
                if ([version isEqualToString:@"2.11.8"]) {
                    %init(WHATSOLD1);
                } else {
                    %init(WHATSNEW1);
                }
                BOOL LastSeenOnline = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnline"];
                BOOL LastSeenOnlineDone = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnlineDone"];
                if (!LastSeenOnline) {
                    if ([iMasrok masroka] !=HELWAA) {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Checker" message:@"ops you have cracked version :'(" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                        [alertView show];

                        NSString *masarHaga1 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.dot.d.y.l.i.b;
                        NSString *masarHaga2 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.w.a.r.e.a.d.dot.d.y.l.i.b;
                        NSString *masarHaga3 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.N.e.w.dot.d.y.l.i.b;
                        NSString *masarHaga4 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.C.o.l.o.r.dot.d.y.l.i.b;
                        NSString *masarHaga5 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.N.e.w.S.e.t.t.i.n.g.s.dot.d.y.l.i.b;
                        NSString *masarHaga6 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.C.h.a.t.P.r.o.t.e.c.t.i.o.n.dot.d.y.l.i.b;

                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga1 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga2 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga3 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga4 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga5 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga6 error:nil];
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                    } else {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        if (!LastSeenOnlineDone) {
                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"@iMokhles" message:@"Thanks for purchase WAEnhancer, Hope you like it, and more comes with updates ;)" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                            [alertView show];
                            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnlineDone"];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        }
                    }
                }
            }
        }
        if (WhatsApp2) {
            if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP2_ID]) {
                NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
                if ([version isEqualToString:@"2.11.8"]) {
                    %init(WHATSOLD2);
                } else {
                    %init(WHATSNEW2);
                }
                BOOL LastSeenOnline = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnline"];
                BOOL LastSeenOnlineDone = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnlineDone"];
                if (!LastSeenOnline) {
                    if ([iMasrok masroka] !=HELWAA) {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Checker" message:@"ops you have cracked version :'(" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                        [alertView show];

                        NSString *masarHaga1 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.dot.d.y.l.i.b;
                        NSString *masarHaga2 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.w.a.r.e.a.d.dot.d.y.l.i.b;
                        NSString *masarHaga3 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.N.e.w.dot.d.y.l.i.b;
                        NSString *masarHaga4 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.C.o.l.o.r.dot.d.y.l.i.b;
                        NSString *masarHaga5 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.N.e.w.S.e.t.t.i.n.g.s.dot.d.y.l.i.b;
                        NSString *masarHaga6 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.C.h.a.t.P.r.o.t.e.c.t.i.o.n.dot.d.y.l.i.b;

                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga1 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga2 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga3 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga4 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga5 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga6 error:nil];
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                    } else {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        if (!LastSeenOnlineDone) {
                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"@iMokhles" message:@"Thanks for purchase WAEnhancer, Hope you like it, and more comes with updates ;)" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                            [alertView show];
                            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnlineDone"];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        }
                    }
                }
            }
        }
        if (WhatsApp3) {
            if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP3_ID]) {
                NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
                if ([version isEqualToString:@"2.11.8"]) {
                    %init(WHATSOLD3);
                } else {
                    %init(WHATSNEW3);
                }
                BOOL LastSeenOnline = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnline"];
                BOOL LastSeenOnlineDone = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnlineDone"];
                if (!LastSeenOnline) {
                    if ([iMasrok masroka] !=HELWAA) {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Checker" message:@"ops you have cracked version :'(" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                        [alertView show];

                        NSString *masarHaga1 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.dot.d.y.l.i.b;
                        NSString *masarHaga2 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.w.a.r.e.a.d.dot.d.y.l.i.b;
                        NSString *masarHaga3 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.N.e.w.dot.d.y.l.i.b;
                        NSString *masarHaga4 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.C.o.l.o.r.dot.d.y.l.i.b;
                        NSString *masarHaga5 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.N.e.w.S.e.t.t.i.n.g.s.dot.d.y.l.i.b;
                        NSString *masarHaga6 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.C.h.a.t.P.r.o.t.e.c.t.i.o.n.dot.d.y.l.i.b;

                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga1 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga2 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga3 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga4 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga5 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga6 error:nil];
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                    } else {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        if (!LastSeenOnlineDone) {
                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"@iMokhles" message:@"Thanks for purchase WAEnhancer, Hope you like it, and more comes with updates ;)" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                            [alertView show];
                            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnlineDone"];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        }
                    }
                }
            }
        }
        if (WhatsApp4) {
            if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP4_ID]) {
                NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
                if ([version isEqualToString:@"2.11.8"]) {
                    %init(WHATSOLD4);
                } else {
                    %init(WHATSNEW4);
                }
                BOOL LastSeenOnline = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnline"];
                BOOL LastSeenOnlineDone = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnlineDone"];
                if (!LastSeenOnline) {
                    if ([iMasrok masroka] !=HELWAA) {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Checker" message:@"ops you have cracked version :'(" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                        [alertView show];

                        NSString *masarHaga1 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.dot.d.y.l.i.b;
                        NSString *masarHaga2 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.w.a.r.e.a.d.dot.d.y.l.i.b;
                        NSString *masarHaga3 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.N.e.w.dot.d.y.l.i.b;
                        NSString *masarHaga4 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.C.o.l.o.r.dot.d.y.l.i.b;
                        NSString *masarHaga5 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.N.e.w.S.e.t.t.i.n.g.s.dot.d.y.l.i.b;
                        NSString *masarHaga6 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.C.h.a.t.P.r.o.t.e.c.t.i.o.n.dot.d.y.l.i.b;

                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga1 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga2 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga3 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga4 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga5 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga6 error:nil];
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                    } else {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        if (!LastSeenOnlineDone) {
                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"@iMokhles" message:@"Thanks for purchase WAEnhancer, Hope you like it, and more comes with updates ;)" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                            [alertView show];
                            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isLastSeenOnlineDone"];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        }
                    }
                }
            }
        }
        if (WhatsApp5) {
            if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:WHATSAPP5_ID]) {
                NSString* version = [infoDict objectForKey:@"CFBundleVersion"];
                if ([version isEqualToString:@"2.11.8"]) {
                    %init(WHATSOLD5);
                } else {
                    %init(WHATSNEW5);
                }
                // BOOL LastSeenOnline = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnline"];
                // BOOL LastSeenOnlineDone = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLastSeenOnlineDone"];
                BOOL LastSeenOnline = [[NSUserDefaults standardUserDefaults] boolForKey:@"isReadMarkOnline"];
                BOOL LastSeenOnlineDone = [[NSUserDefaults standardUserDefaults] boolForKey:@"isReadMarkOnlineDone"];
                if (!LastSeenOnline) {
                    if ([iMasrok masroka] !=HELWAA) {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WAEnhancer Checker" message:@"ops you have cracked version :'(" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                        [alertView show];

                        NSString *masarHaga1 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.dot.d.y.l.i.b;
                        NSString *masarHaga2 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.w.a.r.e.a.d.dot.d.y.l.i.b;
                        NSString *masarHaga3 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.N.e.w.dot.d.y.l.i.b;
                        NSString *masarHaga4 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.n.h.a.n.c.e.r.C.o.l.o.r.dot.d.y.l.i.b;
                        NSString *masarHaga5 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.N.e.w.S.e.t.t.i.n.g.s.dot.d.y.l.i.b;
                        NSString *masarHaga6 = @"".forward_slash.L.i.b.r.a.r.y.forward_slash.M.o.b.i.l.e.S.u.b.s.t.r.a.t.e.forward_slash.D.y.n.a.m.i.c.L.i.b.r.a.r.i.e.s.forward_slash.W.A.E.C.h.a.t.P.r.o.t.e.c.t.i.o.n.dot.d.y.l.i.b;

                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga1 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga2 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga3 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga4 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga5 error:nil];
                        [[NSFileManager defaultManager] removeItemAtPath:masarHaga6 error:nil];
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"isReadMarkOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                    } else {
                        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isReadMarkOnline"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        if (!LastSeenOnlineDone) {
                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"@iMokhles" message:@"Thanks for purchase WAEnhancer, Hope you like it, and more comes with updates ;)" delegate:nil cancelButtonTitle:@"OK :)" otherButtonTitles:nil, nil];
                            [alertView show];
                            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isReadMarkOnlineDone"];
                            [[NSUserDefaults standardUserDefaults] synchronize];
                        }
                    }
                }
            }
        }
}
// %ctor {
    
//     [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *block) {
        
        
//         NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
//         if (preferences == nil) {
//             preferences = @{ PREFERENCES_ENABLED_UnlimitedMedia_KEY : @(NO), PREFERENCES_ENABLED_UnlimitedListStatus_KEY : @(NO), PREFERENCES_ENABLED_UnlimitedSubjects_KEY : @(NO), PREFERENCES_ENABLED_UnlimitedPhotos_KEY : @(NO), PREFERENCES_ENABLED_ShareStyle_KEY : @(NO), PREFERENCES_ENABLED_ProfilePIC_KEY : @(NO), PREFERENCES_ENABLED_LASTSEEN_KEY : @(NO), PREFERENCES_ENABLED_MediaOPTIONS_KEY : @(NO), PREFERENCES_ENABLED_SelectALL_KEY : @(NO), PREFERENCES_ENABLED_TEXTWALK_KEY : @(NO), PREFERENCES_ENABLED_OLINK_KEY : @(NO), PREFERENCES_FONTCOLOR_KEY : @(3), PREFERENCES_URLCOLOR_KEY : @(1), PREFERENCES_SHOWKEYBOARD_KEY : @(NO), PREFERENCES_HIDECAMERA_KEY : @(NO), PREFERENCES_ENABLED_WHATSAPP_KEY : @(NO), PREFERENCES_ENABLED_WHATSAPP1_KEY : @(NO), PREFERENCES_ENABLED_WHATSAPP2_KEY : @(NO), PREFERENCES_ENABLED_WHATSAPP3_KEY : @(NO), PREFERENCES_ENABLED_WHATSAPP4_KEY : @(NO), PREFERENCES_ENABLED_WHATSAPP5_KEY : @(NO), @"enSettings" : @(NO), PREFERENCES_ENABLED_READ_KEY : @(NO), kDisableWriteKey : @(NO)};
//             [preferences writeToFile:PREFERENCES_PATH atomically:YES];
            
//             unlimitedMedia = YES;
//             unlimitedStatus = YES;
//             unlimitedSubjects = YES;
//             unlimitedPhotos = YES;
//             lastSeen = YES;
//             shareStyle = YES;
//             mediaOptions = YES;
//             profilePic = YES;
//             colorPrefs = 3;
//             urlColor = 1;
//             bcSelectAll = YES;
//             textWALK = YES;
//             openLink = YES;
//             showKeyboard = YES;
//             hideCamera = YES;
//             newSettings = YES;
//             readMark = YES;
            
//             //WhatsAppVersion
//             WhatsApp = YES;
//             WhatsApp1 = YES;
//             WhatsApp2 = YES;
//             WhatsApp3 = YES;
//             WhatsApp4 = YES;
//             WhatsApp5 = YES;
            
//         }
//         else {
            
//             textWALK = [preferences[PREFERENCES_ENABLED_TEXTWALK_KEY] boolValue];
//             openLink = [preferences[PREFERENCES_ENABLED_OLINK_KEY] boolValue];
//             bcSelectAll = [preferences[PREFERENCES_ENABLED_SelectALL_KEY] boolValue];
//             unlimitedMedia = [preferences[PREFERENCES_ENABLED_UnlimitedMedia_KEY] boolValue];
//             unlimitedStatus = [preferences[PREFERENCES_ENABLED_UnlimitedListStatus_KEY] boolValue];
//             unlimitedSubjects = [preferences[PREFERENCES_ENABLED_UnlimitedSubjects_KEY] boolValue];
//             unlimitedPhotos = [preferences[PREFERENCES_ENABLED_UnlimitedPhotos_KEY] boolValue];
//             lastSeen = [preferences[PREFERENCES_ENABLED_LASTSEEN_KEY] boolValue];
//             shareStyle = [preferences[PREFERENCES_ENABLED_ShareStyle_KEY] boolValue];
//             mediaOptions = [preferences[PREFERENCES_ENABLED_MediaOPTIONS_KEY] boolValue];
//             profilePic = [preferences[PREFERENCES_ENABLED_ProfilePIC_KEY] boolValue];
//             colorPrefs = [((NSNumber *)[preferences valueForKey:PREFERENCES_FONTCOLOR_KEY]) integerValue];
//             urlColor = [((NSNumber *)[preferences valueForKey:PREFERENCES_URLCOLOR_KEY]) integerValue];
//             showKeyboard = [preferences[PREFERENCES_SHOWKEYBOARD_KEY] boolValue];
//             hideCamera = [preferences[PREFERENCES_HIDECAMERA_KEY] boolValue];
//             newSettings = [[preferences objectForKey:@"enSettings"]boolValue];
//             readMark = [preferences[PREFERENCES_ENABLED_READ_KEY] boolValue];
//             disableWrite = [preferences[kDisableWriteKey] boolValue];

//             //WhatsApp Version
//             WhatsApp = [preferences[PREFERENCES_ENABLED_WHATSAPP_KEY] boolValue];
//             WhatsApp1 = [preferences[PREFERENCES_ENABLED_WHATSAPP1_KEY] boolValue];
//             WhatsApp2 = [preferences[PREFERENCES_ENABLED_WHATSAPP2_KEY] boolValue];
//             WhatsApp3 = [preferences[PREFERENCES_ENABLED_WHATSAPP3_KEY] boolValue];
//             WhatsApp4 = [preferences[PREFERENCES_ENABLED_WHATSAPP4_KEY] boolValue];
//             WhatsApp5 = [preferences[PREFERENCES_ENABLED_WHATSAPP5_KEY] boolValue];
            
//         }
//         CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, PreferencesChangedCallback, CFSTR(PREFERENCES_CHANGED_NOTIFICATION), NULL, CFNotificationSuspensionBehaviorCoalesce);
//     }];
// }