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
    
    // Set AudioSession to play even if the app runs in background
    // Geoloc also must be updated so it can have an interest.
    [[AVAudioSession sharedInstance] setDelegate: self];
    NSError *setCategoryError = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
    
    // Initialize Arrays
    self.soundPlayers = [NSMutableArray new];
    
    NSString *onlineSource = @"jadelombard.map-b5wjq6ss";
    
    self.mapView = [[RMMapView alloc] initWithFrame:self.view.bounds];
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
    
    detailController.infos       = [annotation.userInfo objectForKey:@"point"];
//    detailController.detailDescription = [annotation.userInfo objectForKey:@"description"];
    
    [self.navigationController pushViewController:detailController animated:YES];
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
