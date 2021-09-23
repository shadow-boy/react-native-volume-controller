//
//  ReactNativeVolumeController.m
//  ReactNativeVolumeController
//
//  Created by Victor C Tavernari on 01/04/17.
//  Copyright © 2017 Tavernari. All rights reserved.
//

#import "ReactNativeVolumeController.h"
#import "VolumeSlider.h"

#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@implementation ReactNativeVolumeController{
    VolumeSlider* volumeView;
}

RCT_EXPORT_MODULE()

#pragma mark - Pubic API

- (UIView *)view {
    volumeView = [[VolumeSlider alloc] init];
    return volumeView;
}

RCT_EXPORT_VIEW_PROPERTY(minimumTrackTintColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(maximumTrackTintColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(thumbTintColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(onValueChange, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(thumbImage, UIImage);
RCT_EXPORT_VIEW_PROPERTY(showsRouteButton, BOOL);

RCT_EXPORT_VIEW_PROPERTY(volumeValue, float);



RCT_CUSTOM_VIEW_PROPERTY(thumbSize, RCTthumbSize, VolumeSlider) {
    NSDictionary *thumbSize = (NSDictionary *) json;
    
    [view setThumbWidth:[thumbSize[@"width"] floatValue]];
    [view setThumbHeight:[thumbSize[@"height"] floatValue]];
    
    [view setThumb];
}


/**
外部调用value 设置音量
 */
RCT_EXPORT_METHOD(change:(float)value){
    volumeView.volumeValue = value;
}





@end
