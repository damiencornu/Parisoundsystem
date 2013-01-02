//
//  MyMapViewController.m
//  Tests
//
//  Created by Damien CORNU on 31/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import "MyMapViewController.h"
#define DEBUGGERINTERFACE TRUE

@interface MyMapViewController ()

@end

@implementation MyMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set AudioSession to play even if the app runs in background
    // Geoloc also must be updated so it can have an interest.
    [[AVAudioSession sharedInstance] setDelegate: self];
    NSError *setCategoryError = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
    
    // Initialize Arrays
    self.soundPlayers = [NSMutableArray new];
    
    if (DEBUGGERINTERFACE) {
        self.distanceLabels = [NSMutableArray new];
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(10, 10, self.view.frame.size.width, 20);
        label.text = @"Distance 1: 0 meters";
        [self.view addSubview:label];
        [self.distanceLabels addObject:label];
        label = [[UILabel alloc] init];
        label.frame = CGRectMake(10, 40, self.view.frame.size.width, 20);
        label.text = @"Distance 2: 0 meters";
        [self.view addSubview:label];
        [self.distanceLabels addObject:label];
    
        self.map = [[MKMapView alloc] init];
        self.map.frame = CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height - 70);
        [self.map setMapType:MKMapTypeHybrid];
    } else {
        self.map = [[MKMapView alloc] init];
        self.map.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 0);
        [self.map setMapType:MKMapTypeHybrid];
    }
    
    
    self.map.showsUserLocation = YES;

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager startUpdatingLocation];
    
    CLLocationCoordinate2D zoomLocation;
//    PARIS
    zoomLocation.latitude= 48.85788229770377;
    zoomLocation.longitude= 2.352275848388672;
    
    for(NSDictionary* infos in self.plistArray) {
        // Adding annotations
        CLLocationCoordinate2D coordinates;
        coordinates.latitude = [infos[@"location"][@"latitude"] doubleValue];
        coordinates.longitude = [infos[@"location"][@"longitude"] doubleValue];
        AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] init:coordinates];
        addAnnotation.myTitle = infos[@"location"][@"placeName"];
        addAnnotation.mySubtitle = infos[@"title"];
        [self.map addAnnotation:addAnnotation];
        
        // Locations Array
        
        // Soundsplayers Array
        NSURL *soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], infos[@"fileName"]]];
        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
        [self.soundPlayers addObject:audioPlayer];        
    }

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(zoomLocation, 1500, 1500);
    
    [self.map setRegion:region animated:YES];
    
    [self.view addSubview:self.map];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSUInteger index;
    for(NSDictionary* infos in self.plistArray) {
        index = [self.plistArray indexOfObject:infos];
        CLLocation *infoLoc = [[CLLocation alloc] initWithLatitude:[infos[@"location"][@"latitude"] doubleValue] longitude:[infos[@"location"][@"longitude"] doubleValue]];
        CLLocationDistance distance = [infoLoc distanceFromLocation:newLocation];

        if(DEBUGGERINTERFACE) {
            UILabel *label = [self.distanceLabels objectAtIndex:index];
            NSLog([NSString stringWithFormat:@"Distance %u: %.1f meters", index+1, distance]);
            label.text = [NSString stringWithFormat:@"Distance %u: %.1f meters", index+1, distance];
        }
        // Start / Stop playing a sound
        AVAudioPlayer *currentPlayer = [self.soundPlayers objectAtIndex:index];
        BOOL isPlaying = currentPlayer.isPlaying;
        NSLog(@"%f & %c", distance, isPlaying);
        if (distance <= 50 && !isPlaying) {
            [currentPlayer play];
            NSLog(@"play now!");
        } else if (distance > 50 && isPlaying) {
            [currentPlayer stop];
            NSLog(@"Stop now!");
        }
        NSLog(@"object at index %d : %@ is %f meters away", index, infos[@"title"], distance);
    }
}

@end
