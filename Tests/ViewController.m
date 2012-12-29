//
//  ViewController.m
//  Tests
//
//  Created by Damien CORNU on 24/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timeSoundOne, controlSondOne, volumeSoundOne, timeSoundTwo, controlSondTwo, volumeSoundTwo;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    
    [[AVAudioSession sharedInstance] setDelegate: self];
    NSError *setCategoryError = nil;  
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
    
    UILabel *soundsLabel = [[UILabel alloc] init];
    soundsLabel.frame = CGRectMake(10, 10, self.view.frame.size.width - 20, 20);
    soundsLabel.text = @"List of sounds:";
    soundsLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:soundsLabel];
    
    // Sound one Label + time label + button
    UILabel *soundOne = [[UILabel alloc] init];
    soundOne.frame = CGRectMake(50, 80, self.view.frame.size.width - 60, 20);
    soundOne.text = @"Sound one: Heart Attack";
    soundOne.backgroundColor = [UIColor clearColor];
    [self.view addSubview:soundOne];
    
    self.timeSoundOne = [[UILabel alloc] init];
    self.timeSoundOne.frame = CGRectMake(50, 100, self.view.frame.size.width - 60, 20);
    self.timeSoundOne.text = @"0";
    self.timeSoundOne.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.timeSoundOne];
    
    self.controlSondOne = [[UIButton alloc] init];
    self.controlSondOne.frame = CGRectMake(10, 82, 36, 36);
    self.controlSondOne.backgroundColor = [UIColor whiteColor];
    [self.controlSondOne setBackgroundImage:[UIImage imageNamed:@"Pause.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.controlSondOne];
    [self.controlSondOne addTarget:self action:@selector(togglePlay:) forControlEvents:UIControlEventTouchDown];
    
    self.volumeSoundOne = [[UISlider alloc] init];
    self.volumeSoundOne.frame = CGRectMake(10, 125, self.view.frame.size.width - 20, 20);
    self.volumeSoundOne.backgroundColor = [UIColor clearColor];
    [self.view addSubview:volumeSoundOne];
    [self.volumeSoundOne setValue:1.0];
    [self.volumeSoundOne addTarget:self action:@selector(sliderOneValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    UILabel *soundTwo = [[UILabel alloc] init];
    soundTwo.frame = CGRectMake(50, 200, self.view.frame.size.width - 60, 20);
    soundTwo.text = @"Sound Two: California Girls";
    soundTwo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:soundTwo];
    
    self.timeSoundTwo = [[UILabel alloc] init];
    self.timeSoundTwo.frame = CGRectMake(50, 220, self.view.frame.size.width - 60, 20);
    self.timeSoundTwo.text = @"0";
    self.timeSoundTwo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.timeSoundTwo];
    
    self.controlSondTwo = [[UIButton alloc] init];
    self.controlSondTwo.frame = CGRectMake(10, 202, 36, 36);
    self.controlSondTwo.backgroundColor = [UIColor whiteColor];
    [self.controlSondTwo setBackgroundImage:[UIImage imageNamed:@"Pause.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.controlSondTwo];
    [self.controlSondTwo addTarget:self action:@selector(togglePlayTwo:) forControlEvents:UIControlEventTouchDown];

    
    self.volumeSoundTwo = [[UISlider alloc] init];
    self.volumeSoundTwo.frame = CGRectMake(10, 245, self.view.frame.size.width - 20, 20);
    self.volumeSoundTwo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:volumeSoundTwo];
    [self.volumeSoundTwo setValue:1.0];
    [self.volumeSoundTwo addTarget:self action:@selector(sliderTwoValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    NSURL *soundOneURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/01 Heart Attack.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error;
    audioPlayerOne = [[AVAudioPlayer alloc] initWithContentsOfURL:soundOneURL error:&error];
    if (audioPlayerOne == nil) {
        NSLog([error description]);
    } else {
        [audioPlayerOne play];
        [audioPlayerOne setDelegate:self];
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    }
    
    NSURL *soundTwoURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/02 California Girls.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    audioPlayerTwo = [[AVAudioPlayer alloc] initWithContentsOfURL:soundTwoURL error:&error];
    if (audioPlayerTwo == nil) {
        NSLog([error description]);
    } else {
        [audioPlayerTwo play];
        [audioPlayerTwo setDelegate:self];
//        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    }
}

-(void)togglePlay:(id)sender {
    NSLog(@"%@", audioPlayerOne.isPlaying ? @"YES" : @"NO");
    if (audioPlayerOne.isPlaying == YES) {
        [audioPlayerOne pause];
        [self.controlSondOne setBackgroundImage:[UIImage imageNamed:@"Play.png"] forState:UIControlStateNormal];
    } else {
        [audioPlayerOne play];
        [self.controlSondOne setBackgroundImage:[UIImage imageNamed:@"Pause.png"] forState:UIControlStateNormal];
    }
}
-(void)togglePlayTwo:(id)sender {
    NSLog(@"%@", audioPlayerTwo.isPlaying ? @"YES" : @"NO");
    if (audioPlayerTwo.isPlaying == YES) {
        [audioPlayerTwo pause];
        [self.controlSondTwo setBackgroundImage:[UIImage imageNamed:@"Play.png"] forState:UIControlStateNormal];
    } else {
        [audioPlayerTwo play];
        [self.controlSondTwo setBackgroundImage:[UIImage imageNamed:@"Pause.png"] forState:UIControlStateNormal];
    }
}

-(IBAction)sliderOneValueChanged:(UISlider *)sender {
    [audioPlayerOne setVolume:sender.value];
//    NSLog(@"slider value = %f", sender.value);
}
-(IBAction)sliderTwoValueChanged:(UISlider *)sender {
    [audioPlayerTwo setVolume:sender.value];
//    NSLog(@"slider value = %f", sender.value);
}

-(void)updateTime: (NSTimer *)theTimer {
    NSString *timeOne = [NSString stringWithFormat:@"%.f / %.f", audioPlayerOne.currentTime, audioPlayerOne.duration];
    timeSoundOne.text = timeOne;
    NSString *timeTwo = [NSString stringWithFormat:@"%.f / %.f", audioPlayerTwo.currentTime, audioPlayerTwo.duration];
    timeSoundTwo.text = timeTwo;
    
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"Finish playing");
    [timer invalidate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
