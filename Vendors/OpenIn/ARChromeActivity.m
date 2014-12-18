/*
  ARChromeActivity.m

  Copyright (c) 2012 Alex Robinson
 
  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


#import "ARChromeActivity.h"
#import "BrowseInAppViewController.h"

@implementation ARChromeActivity {
    NSURL *_activityURL;
}

@synthesize callbackURL = _callbackURL;
@synthesize callbackSource = _callbackSource;
@synthesize activityTitle = _activityTitle;

static NSString *encodeByAddingPercentEscapes(NSString *input) {
    NSString *encodedValue = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)input, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    return encodedValue;
}

- (void)commonInit {
    NSString *localizePath = @"/Library/Application Support/WAEnhancer/";
    _callbackSource = localizePath;
    _activityTitle = @"Open in Chrome";
}

- (id)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCallbackURL:(NSURL *)callbackURL {
    self = [super init];
    if (self) {
        [self commonInit];
        _callbackURL = callbackURL;
    }
    return self;
}

- (UIImage *)activityImage {
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        // do stuff for iOS 7 and newer
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            NSString *imagePath = @"/Library/Application Support/WAEnhancer/ARChromeActivity7~iPad.png";
            return [UIImage imageWithContentsOfFile:imagePath];
        } else {
            
            NSString *imagePath = @"/Library/Application Support/WAEnhancer/ARChromeActivity7.png";
            return [UIImage imageWithContentsOfFile:imagePath];
        }
        
    }
    else {
        // do stuff for older versions than iOS 7
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            NSString *imagePath = @"/Library/Application Support/WAEnhancer/ARChromeActivity~iPad.png";
            return [UIImage imageWithContentsOfFile:imagePath];
        } else {
            
            NSString *imagePath = @"/Library/Application Support/WAEnhancer/ARChromeActivity.png";
            return [UIImage imageWithContentsOfFile:imagePath];
        }
    }
    
    NSString *imagePath = @"/Library/Application Support/WAEnhancer/ARChromeActivity.png";
    return [UIImage imageWithContentsOfFile:imagePath];
}

- (NSString *)activityType {
    return NSStringFromClass([self class]);
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return [[activityItems lastObject] isKindOfClass:[NSURL class]] && [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"googlechrome-x-callback://"]];
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for(id item in activityItems){
        if([item isKindOfClass:NSURL.class]){
            _activityURL = (NSURL *)item;
        }
    }
}

- (void)performActivity {
    NSString *openingURL = encodeByAddingPercentEscapes(_activityURL.absoluteString);
    NSString *callbackURL = encodeByAddingPercentEscapes(self.callbackURL.absoluteString);
    NSString *sourceName = encodeByAddingPercentEscapes(self.callbackSource);

    NSURL *activityURL = [NSURL URLWithString:[NSString stringWithFormat:@"googlechrome-x-callback://x-callback-url/open/?url=%@&x-success=%@&x-source=%@", openingURL, callbackURL, sourceName]];
    [[UIApplication sharedApplication] openURL:activityURL];
    [BrowseInAppViewController dismiss];
    [self activityDidFinish:YES];
}

@end