//
//  BMAVUtils.m
//  BookMap
//
//  Created by jayhuan on 2020/10/1.
//  Copyright © 2020 jayhuan. All rights reserved.
//

#import "BMAVUtils.h"

@implementation BMAVUtils

+ (AVCaptureDevice *)cameraDeviceOfPosition:(AVCaptureDevicePosition)position {
    NSArray<AVCaptureDeviceType> *deviceTypes = @[AVCaptureDeviceTypeBuiltInDualCamera, AVCaptureDeviceTypeBuiltInTelephotoCamera, AVCaptureDeviceTypeBuiltInWideAngleCamera];
    AVCaptureDeviceDiscoverySession *session = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:deviceTypes mediaType:AVMediaTypeVideo position:position];
    for (AVCaptureDevice *device in session.devices) {
        if (device.position == position) {
            return device;
        }
    }
    return nil;
}

@end
