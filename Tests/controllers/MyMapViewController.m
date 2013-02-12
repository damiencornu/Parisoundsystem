//
//  MyMapViewController.m
//  Tests
//
//  Created by Damien CORNU on 31/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import "MyMapViewController.h"
#import "UIColor+MBWPExtensions.h"
#import "DetailViewController.h"

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
    
    self.nowPlayingToggled = NO;
    
    // Set AudioSession to play even if the app runs in background
    // Geoloc also must be updated so it can have an interest.
    [[AVAudioSession sharedInstance] setDelegate: self];
    NSError *setCategoryError = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
    
    // Initialize Arrays
    self.soundPlayers = [NSMutableArray new];
    
    NSString *onlineSource = @"jadelombard.map-b5wjq6ss";
    
    self.mapView = [[RMMapView alloc] init];
    self.mapView.frame = CGRectMake(0, 49, self.view.frame.size.width, self.view.frame.size.height - 49);
    self.mapView.tileSource = [[RMMapBoxSource alloc] initWithMapID:onlineSource];
    
    CLLocationCoordinate2D zoomLocation;
//    PARIS
    zoomLocation.latitude= 48.85788229770377;
    zoomLocation.longitude= 2.352275848388672;

    self.mapView.centerCoordinate = zoomLocation;
    self.mapView.zoom = 12;
    
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.mapView];
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 48.85322326468132;
    coordinate.longitude = 2.3691844940185547;
    
    for(NSDictionary* point in self.plistArray) {
        NSLog(@"Iitializing %@", [point objectForKey:@"title"]);
        
        RMAnnotation *annotation = [[RMAnnotation alloc]initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake([point[@"location"][@"latitude"] doubleValue], [point[@"location"][@"longitude"] doubleValue]) andTitle:point[@"location"][@"placeName"]];
        annotation.annotationIcon = [UIImage imageNamed:@"map-pin.png"];
        annotation.anchorPoint = CGPointMake(0.5, 1.0);
        annotation.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                               point, @"point",
                               nil];
        [self.mapView addAnnotation:annotation];

        // Soundsplayers Array
        //        NSURL *soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], infos[@"fileName"]]];
        //        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
        //        [self.soundPlayers addObject:audioPlayer];
    }
    
    self.soundsPlayingPannel = [[UIView alloc] initWithFrame:CGRectMake(0, -151, self.view.frame.size.width, 200)];
    self.soundsPlayingPannel.backgroundColor = [UIColor colorWithRed:0.157 green:0.914 blue:0.859 alpha:1];
    [self.view addSubview:self.soundsPlayingPannel];
    UILabel *labelNowPlaying = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, self.view.frame.size.width - 20, 32)];
    labelNowPlaying.backgroundColor = [UIColor clearColor];
    [labelNowPlaying setFont:[UIFont fontWithName:@"Executive-55Reg" size:24]];
    labelNowPlaying.text = @"now playing";
    [self.soundsPlayingPannel addSubview:labelNowPlaying];
    
    self.logo = [[UIButton alloc] init];
    self.logo.frame = CGRectMake(0, 0, self.view.frame.size.width, 49);
    [self.logo setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
    [self.logo setImage:[UIImage imageNamed:@"logo-active.jpg"] forState:UIControlStateSelected];
    [self.view addSubview:self.logo];
    [self.logo addTarget:self action:@selector(toggleNowPlaying:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation {
    NSLog(@"Real pin");
    RMMarker *marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"map-pin.png"] anchorPoint: CGPointMake(0.5, 1.0)];
    if (annotation.isUserLocationAnnotation){
        [marker replaceUIImage:[UIImage imageNamed:@"user-location-pin.png"]];
        NSLog(@"User's location pin");
    }

    marker.canShowCallout = YES;
    
    marker.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return marker;
}

- (void)tapOnCalloutAccessoryControl:(UIControl *)control forAnnotation:(RMAnnotation *)annotation onMap:(RMMapView *)map
{
    DetailViewController *detailController = [[DetailViewController alloc] init];
    
    detailController.infos = [annotation.userInfo objectForKey:@"point"];
//    detailController.detailDescription = [annotation.userInfo objectForKey:@"description"];
    
    [self.navigationController pushViewController:detailController animated:YES];
}

- (void) toggleNowPlaying:(UIButton*) sender {
    NSLog(@"Toggle now playing");
    CGRect soundsPlayingPannelFrame = self.soundsPlayingPannel.frame;
    if(self.nowPlayingToggled){
        NSLog(@"On range le panneau \"now playing\"");
        self.nowPlayingToggled = NO;
        [self.logo setSelected:NO];
        soundsPlayingPannelFrame.origin.y = -151;
    } else {
        NSLog(@"On sort le panneau \"now playing\"");
        soundsPlayingPannelFrame.origin.y = 49;
        self.nowPlayingToggled = YES;
        [self.logo setSelected:YES];
    }
    [UIView animateWithDuration:0.5
                          delay:0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         self.soundsPlayingPannel.frame = soundsPlayingPannelFrame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Animation Done!");
                     }];
}

//
//- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
//    NSUInteger index;
//    for(NSDictionary* infos in self.plistArray) {
//        index = [self.plistArray indexOfObject:infos];
//        CLLocation *infoLoc = [[CLLocation alloc] initWithLatitude:[infos[@"location"][@"latitude"] doubleValue] longitude:[infos[@"location"][@"longitude"] doubleValue]];
//        CLLocationDistance distance = [infoLoc distanceFromLocation:newLocation];
//
//        // Start / Stop playing a sound
//        AVAudioPlayer *currentPlayer = [self.soundPlayers objectAtIndex:index];
//        BOOL isPlaying = currentPlayer.isPlaying;
//        NSLog(@"%f & %c", distance, isPlaying);
//        if (distance <= 50 && !isPlaying) {
//            [currentPlayer play];
//            NSLog(@"play now!");
//        } else if (distance > 50 && isPlaying) {
//            [currentPlayer stop];
//            NSLog(@"Stop now!");
//        }
//        NSLog(@"object at index %d : %@ is %f meters away", index, infos[@"title"], distance);
//    }
//}

@end
