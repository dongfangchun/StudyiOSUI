//
//  MyAudioViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/7/14.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "MyAudioViewController.h"
#include <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface MyAudioViewController ()
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation MyAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //播放背景音乐
    NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"beyond" ofType:@"mp3"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:musicPath];
    
    // 创建播放器
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player prepareToPlay];
    [self.player setVolume:1];
    self.player.numberOfLoops = -1; //设置音乐播放次数  -1为一直循环
    [self.player play]; //播放
    

}

- (IBAction)play:(id)sender {
    [self.player play];
}

- (IBAction)stop:(id)sender {
    [self.player pause];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
