//
//  BMAVUtils.h
//  BookMap
//
//  Created by jayhuan on 2020/10/1.
//  Copyright © 2020 jayhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BMAVUtils : NSObject

+ (AVCaptureDevice *)cameraDeviceOfPosition:(AVCaptureDevicePosition)position;

@end

NS_ASSUME_NONNULL_END
