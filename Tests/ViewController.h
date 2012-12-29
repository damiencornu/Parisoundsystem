//
//  ViewController.h
//  Tests
//
//  Created by Damien CORNU on 24/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate> {
    AVAudioPlayer *audioPlayerOne;
    AVAudioPlayer *audioPlayerTwo;
    NSTimer *timer;
}

@property (strong, nonatomic) UILabel *timeSoundOne;
@property (strong, nonatomic) UIButton *controlSondOne;
@property (strong, nonatomic) UISlider *volumeSoundOne;

@property (strong, nonatomic) UILabel *timeSoundTwo;
@property (strong, nonatomic) UIButton *controlSondTwo;
@property (strong, nonatomic) UISlider *volumeSoundTwo;

@end
