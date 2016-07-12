//
//  AudioTool.m
//  音乐播放器封装
//
//  Created by lanou3g on 16/7/11.
//  Copyright © 2016年 fanlianyou. All rights reserved.
//

#import "AudioTool.h"
#import <AVFoundation/AVFoundation.h>

@interface AudioTool ()

@end
static NSMutableDictionary*_players;
@implementation AudioTool

//-(NSMutableDictionary *)MusicDict{
//    
//    if (!_MusicDict) {
//        _MusicDict=[NSMutableDictionary dictionary];
//    }
//    
//    return _MusicDict;
//}

+(void)initialize{
    
    _players=[NSMutableDictionary dictionary];
    
    
    
}
+(AVAudioPlayer*)playMusicWithMusicName:(NSString*)musicName{
    //定义一个空闲播放器（音乐）
    AVAudioPlayer*player=nil;
    
    //从字典中取出播放器
    player=_players[musicName];
    if (!player) {
        
        NSURL*url=[[NSBundle mainBundle]URLForResource:musicName withExtension:nil];
        player=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        
        [_players setObject:player forKey:musicName];
        [player prepareToPlay];
        
    }

//      player.duration;

    [player play];
    return player;
}




+(void)pauseMusicWithMusiName:(NSString*)musicName{
    AVPlayer*player=nil;
    player=_players[musicName];
    if (player) {
        [player pause];
    }
}
+(void)stopMusicWithMusicName:(NSString*)musicName{
    AVPlayer*player=nil;
    player=_players[musicName];
    if (player) {
        [_players removeObjectForKey:musicName];
    }
    
    
    
}
+(void)NextMusicWithMusicName:(NSString*)musicName{
    
    AVPlayer*player=nil;
    player=_players[musicName];
    if (!player) {
        NSURL *url=[[NSBundle mainBundle]URLForResource:musicName withExtension:nil];
        player =[AVPlayer playerWithURL:url];
        
        [player play];
        
    }
    
    
    
    
}
@end
