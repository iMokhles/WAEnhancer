//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class ForwardPickerViewController, NSDictionary, NSString;

@protocol ForwardPickerDelegate <NSObject>
- (void)forwardPickerDidCancel:(ForwardPickerViewController *)arg1;
- (void)forwardPicker:(ForwardPickerViewController *)arg1 didSelectContact:(NSDictionary *)arg2;

@optional
- (NSString *)forwardPicker:(ForwardPickerViewController *)arg1 confirmationTextForContact:(NSDictionary *)arg2;
@end

