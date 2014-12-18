//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSMutableArray, NSString;

__attribute__((visibility("hidden")))
@interface TextBlock : NSObject
{
    NSMutableArray *_textRects;
    BOOL _highlighted;
    NSString *_text;
    NSString *_url;
    id _data;
    struct _NSRange _range;
    unsigned long long _type;
}

+ (id)blockWithRange:(struct _NSRange)arg1 text:(id)arg2;
@property(nonatomic) BOOL highlighted; // @synthesize highlighted=_highlighted;
@property(nonatomic) unsigned long long type; // @synthesize type=_type;
@property(retain, nonatomic) id data; // @synthesize data=_data;
@property(retain, nonatomic) NSString *url; // @synthesize url=_url;
@property(retain, nonatomic) NSString *text; // @synthesize text=_text;
@property(nonatomic) struct _NSRange range; // @synthesize range=_range;

- (void)deleteAllTextRects;
- (void)addTextRect:(id)arg1;
- (id)textRects;
- (id)initWithRange:(struct _NSRange)arg1 text:(id)arg2;

@end

