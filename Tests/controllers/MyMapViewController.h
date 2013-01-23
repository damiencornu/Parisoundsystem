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
#import "MapBox/MapBox.h"

@interface MyMapViewController : UIViewController <RMMapViewDelegate, AVAudioPlayerDelegate>

@property (strong) IBOutlet RMMapView *mapView;
@property (strong, nonatomic) NSMutableArray *plistArray;
@property (strong, nonatomic) NSMutableArray *soundPlayers;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) NSMutableArray *distanceLabels;

@end
