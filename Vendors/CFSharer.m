//
//  Sharer.m
//  CFShareCircle
//
//  Created by Camden on 1/15/13.
//  Copyright (c) 2013 Camden. All rights reserved.
//

#import "CFSharer.h"

@implementation CFSharer

@synthesize name = _name;
@synthesize image = _image;

- (id)initWithName:(NSString *)name imageName:(NSString *)imageName {
    self = [super init];
    if (self) {
        _name = name;
        _image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"/Library/Application Support/WAEnhancer/%@", imageName]];
    }
    return self;    
}

+ (CFSharer *)sendIMGVID {
    return [[CFSharer alloc] initWithName:@"Ph&Vid" imageName:@"photovideo.png"];
}

+ (CFSharer *)sendIMG {
    return [[CFSharer alloc] initWithName:@"Photo" imageName:@"photo.png"];
}

+ (CFSharer *)sendVID {
    return [[CFSharer alloc] initWithName:@"Video" imageName:@"video.png"];
}

+ (CFSharer *)sendLOCT {
    return [[CFSharer alloc] initWithName:@"Location" imageName:@"location.png"];
}

+ (CFSharer *)sendCNTC {
    return [[CFSharer alloc] initWithName:@"Contact" imageName:@"contact.png"];
}

+ (CFSharer *)sendLAST {
    return [[CFSharer alloc] initWithName:@"LSImage" imageName:@"lastimage.png"];
}

+ (CFSharer *)sendEDIT {
    return [[CFSharer alloc] initWithName:@"FiImage" imageName:@"editimage.png"];
}
+ (CFSharer *)sendMUSIC {
    return [[CFSharer alloc] initWithName:@"Music" imageName:@"music.png"];
}
@end
