//
//  ViewController.m
//  音乐播放器封装
//
//  Created by lanou3g on 16/7/11.
//  Copyright © 2016年 fanlianyou. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "AudioTool.h"
#import "Masonry.h"
@interface ViewController ()
@property(nonatomic,assign)SystemSoundID soundID;
@property (strong, nonatomic) IBOutlet UIImageView *backImagev;
@property (strong, nonatomic) IBOutlet UISlider *progressSlider;
@property(nonatomic,assign)BOOL isPlay;
@property(nonatomic,assign)CGFloat TotalTime;
@property(nonatomic,assign)CGFloat currentTime;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpToolBar];
    [self setUpSlider];
    
 
    self.isPlay=YES;
    
    [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    
    
}



-(void)setUpSlider{
    //设置滑块
    [self.progressSlider setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:(UIControlStateNormal)];
    
    
}
-(void)setUpToolBar{
    UIToolbar*toolBar=[[UIToolbar alloc]init];
    [self.backImagev addSubview:toolBar];
    [toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backImagev.mas_top);
        make.bottom.mas_equalTo(self.backImagev.mas_bottom);
        make.left.mas_equalTo(self.backImagev.mas_left);
        make.right.mas_equalTo(self.backImagev.mas_right);
        
        
    }];
    
    
    
}

-(void)timeAction{
    self.progressSlider.value=self.currentTime/self.TotalTime;
    
    
    
}
- (IBAction)topneMusic:(id)sender {
   
    
    
}
- (IBAction)playMusic:(id)sender {
    [sender setTitle:@"暂停" forState:(UIControlStateNormal)];
    
    if (self.isPlay==YES) {
       AVAudioPlayer*player= [AudioTool playMusicWithMusicName:@"薛之谦 - 我好像在哪见过你.mp3"];
        self.isPlay=NO;
        self.TotalTime=player.duration;
        self.currentTime=player.currentTime;
      
    }else{
        [sender setTitle:@"播放" forState:(UIControlStateNormal)];
        [AudioTool pauseMusicWithMusiName:@"薛之谦 - 我好像在哪见过你.mp3"];
          self.isPlay=YES;
    }
   
}
- (IBAction)nextMusic:(id)sender {
}
- (IBAction)sliderAction:(id)sender {
    
    
}


@end
