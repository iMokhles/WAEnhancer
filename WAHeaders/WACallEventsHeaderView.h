//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "UIView.h"

__attribute__((visibility("hidden")))
@interface WACallEventsHeaderView : UIView
{
    UIView *_topLine;
    UIView *_topLineShadow;
    UIView *_bottomLine;
    UIView *_bottomLineShadow;
}


- (void)layoutSubviews;
- (float)appendEvents:(id)arg1 startingAtOffset:(float)arg2 includeDate:(BOOL)arg3;
- (id)initWithAggregateCallEvent:(id)arg1;

@end

