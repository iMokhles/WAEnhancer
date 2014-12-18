//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSError, NSURLRequest, UIWebView;

@protocol UIWebViewDelegate <NSObject>

@optional
- (void)webView:(UIWebView *)arg1 didFailLoadWithError:(NSError *)arg2;
- (void)webViewDidFinishLoad:(UIWebView *)arg1;
- (void)webViewDidStartLoad:(UIWebView *)arg1;
- (BOOL)webView:(UIWebView *)arg1 shouldStartLoadWithRequest:(NSURLRequest *)arg2 navigationType:(int)arg3;
@end
