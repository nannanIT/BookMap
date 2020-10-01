//
//  BMAVCapturer.m
//  BookMap
//
//  Created by jayhuan on 2020/10/1.
//  Copyright © 2020 jayhuan. All rights reserved.
//

#import "BMAVCapturer.h"
#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "BMAVUtils.h"

@interface BMAVCapturer ()<AVCapturePhotoCaptureDelegate,
    AVCaptureVideoDataOutputSampleBufferDelegate,
    AVCaptureAudioDataOutputSampleBufferDelegate>
@property(nonatomic, strong) AVCaptureSession *session;
@property(nonatomic, strong) AVCaptureDeviceInput *videoInput;
@property(nonatomic, strong) AVCaptureDeviceInput *audioInput;
@property(nonatomic, strong) AVCaptureVideoDataOutput *videoOutput;
@property(nonatomic, strong) AVCaptureAudioDataOutput *audioOutput;
@property(nonatomic, strong) AVCapturePhotoOutput *photoOutput;
@property(nonatomic, strong) AVAssetWriter *assetWriter;
@property(nonatomic, strong) AVAssetWriterInput *videoAssetWriter;
@property(nonatomic, strong) AVAssetWriterInput *audioAssetWriter;
@end

@implementation BMAVCapturer

- (instancetype)init {
    if (self = [super init]) {
        [self p_setupInput];
        [self p_setupOutput];
    }
    return self;
}

#pragma mark - private

- (void)p_setupInput {
    self.videoInput = ({
        AVCaptureDevice *device = [BMAVUtils cameraDeviceOfPosition:AVCaptureDevicePositionBack];
        AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
        videoInput;
    });
}

- (void)p_setupOutput {
    self.videoOutput = ({
        AVCaptureVideoDataOutput *videoOutput = [[AVCaptureVideoDataOutput alloc] init];
        [videoOutput setSampleBufferDelegate:self
                                       queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
        videoOutput;
    });
    
    self.audioOutput = ({
        AVCaptureAudioDataOutput *audioOutput = [[AVCaptureAudioDataOutput alloc] init];
        [audioOutput setSampleBufferDelegate:self queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
        audioOutput;
    });
    
    self.photoOutput = [[AVCapturePhotoOutput alloc] init];
}

- (void)p_setupSession {
    self.session = ({
        AVCaptureSession *session = [[AVCaptureSession alloc] init];
        [session setSessionPreset:AVCaptureSessionPreset1280x720];
        [session addInput:self.videoInput];
        [session addInput:self.audioInput];
        [session addOutput:self.videoOutput];
        [session addOutput:self.audioOutput];
        [session addOutput:self.photoOutput];
        session;
    });
}

#pragma mark - AVCapturePhotoCaptureDelegate

- (void)captureOutput:(AVCapturePhotoOutput *)output didFinishProcessingPhoto:(nonnull AVCapturePhoto *)photo error:(nullable NSError *)error {
    NSData *data = [photo fileDataRepresentation];
    UIImage *image = [UIImage imageWithData:data];
}

#pragma mark - AVCaptureVideoDataOutputSampleBufferDelegate & AVCaptureAudioDataOutputSampleBufferDelegate

- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    
}

@end
