//
//  SoundsListViewController.h
//  Tests
//
//  Created by Damien CORNU on 24/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundsListViewController : UITableViewController <AVAudioPlayerDelegate> {
    AVAudioPlayer *audioPlayerOne;
    AVAudioPlayer *audioPlayerTwo;
    NSTimer *timer;
}

@property (strong, nonatomic) NSMutableArray *plistArray;

@property (strong, nonatomic) UIImageView *logo;

@end
