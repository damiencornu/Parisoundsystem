//
//  MyMapViewController.h
//  Tests
//
//  Created by Damien CORNU on 31/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AddressAnnotation.h"

@interface MyMapViewController : UIViewController <CLLocationManagerDelegate, AVAudioPlayerDelegate>

@property (strong, nonatomic) NSMutableArray *plistArray;
@property (strong, nonatomic) NSMutableArray *soundPlayers;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) NSMutableArray *distanceLabels;

@end
