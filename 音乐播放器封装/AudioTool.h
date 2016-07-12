//
//  AudioTool.h
//  音乐播放器封装
//
//  Created by lanou3g on 16/7/11.
//  Copyright © 2016年 fanlianyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioTool : NSObject
+(AVAudioPlayer*)playMusicWithMusicName:(NSString*)musicName;
+(void)pauseMusicWithMusiName:(NSString*)musicName;
+(void)stopMusicWithMusicName:(NSString*)musicName;
+(void)NextMusicWithMusicName:(NSString*)musicName;

@end
