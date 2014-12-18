//
//  BYQuickShotView.m
//  WAEnhancer
//
//  Created by iMokhles on 22.03.14.
//  Copyright (c) 2014 iMokhles. All rights reserved.
//

#import "BYQuickShotView.h"
#import <CoreMedia/CoreMedia.h>
#import <QuartzCore/QuartzCore.h>

@interface BYQuickShotView ()

- (void)prepareSession;
- (AVCaptureDevice*)rearCamera;
- (CGRect)previewLayerFrame;

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;

@end

#define PREVIEW_LAYER_INSET 8
#define PREVIEW_LAYER_EDGE_RADIUS 10
#define BUTTON_SIZE 50

@implementation BYQuickShotView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareSession];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (CGRect)previewLayerFrame
{
    CGRect layerFrame = [[UIScreen mainScreen] bounds];
    return layerFrame;
}

//This method returns the AVCaptureDevice we want to use as an input for our AVCaptureSession

- (AVCaptureDevice *)rearCamera {
    NSArray *videoDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    AVCaptureDevice *captureDevice;
    for (AVCaptureDevice *device in videoDevices)
    {
        if (device.position == AVCaptureDevicePositionBack)
        {
            captureDevice = device;
        }
    }
    return captureDevice;
}

// if we want to add a shadow without drawing out of bounds we have to slightly resize the AVCaptureVideoPreviewLayer
// and this method returns trhe frame we need to achieve this



- (void)prepareSession {
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    //capture session setup
    AVCaptureDeviceInput *newVideoInput = [[AVCaptureDeviceInput alloc] initWithDevice:self.rearCamera error:nil];
    AVCaptureStillImageOutput *newStillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    AVVideoCodecJPEG, AVVideoCodecKey,
                                    nil];
    [newStillImageOutput setOutputSettings:outputSettings];
    
    AVCaptureSession *newCaptureSession = [[AVCaptureSession alloc] init];
    
    if ([newCaptureSession canAddInput:newVideoInput]) {
        [newCaptureSession addInput:newVideoInput];
    }
    
    if ([newCaptureSession canAddOutput:newStillImageOutput]) {
        [newCaptureSession addOutput:newStillImageOutput];
        self.stillImageOutput = newStillImageOutput;
        self.captureSession = newCaptureSession;
    }
    // -startRunning will only return when the session started (-> the camera is then ready)
    dispatch_queue_t layerQ = dispatch_queue_create("layerQ", NULL);
    dispatch_async(layerQ, ^{
        [self.captureSession startRunning];
        AVCaptureVideoPreviewLayer *prevLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.captureSession];
        prevLayer.frame = self.previewLayerFrame;
        prevLayer.masksToBounds = YES;
        prevLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        //prevLayer.cornerRadius = PREVIEW_LAYER_EDGE_RADIUS;
        //to make sure were not modifying the UI on a thread other than the main thread, use dispatch_async w/ dispatch_get_main_queue
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.layer insertSublayer:prevLayer atIndex:0];
        });
    }); 
}
@end
