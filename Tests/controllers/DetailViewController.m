//
//  DetailViewController.m
//  Tests
//
//  Created by Damien CORNU on 29/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import "MyMapViewController.h"
#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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

    self.view.backgroundColor = [UIColor clearColor];
    
    self.title = self.infos[@"title"];
    NSLog(@"%@", self.infos);

    UILabel *locationTitle = [[UILabel alloc] init];
    locationTitle.frame = CGRectMake(10, 10, self.view.frame.size.width - 20, 16);
    locationTitle.text = [NSString stringWithFormat:@"Location: %@", self.infos[@"location"] [@"placeName"]];
    [self.view addSubview:locationTitle];
    
    
    self.mapView = [[RMMapView alloc] initWithFrame:self.view.bounds];
    NSString *onlineSource = @"jadelombard.map-b5wjq6ss";
    self.mapView.tileSource = [[RMMapBoxSource alloc] initWithMapID:onlineSource];
    
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    CLLocationCoordinate2D zoomLocation;
//    PARIS
    zoomLocation.latitude= [self.infos[@"location"][@"latitude"] doubleValue];
    zoomLocation.longitude= [self.infos[@"location"][@"longitude"] doubleValue];

    self.mapView.centerCoordinate = zoomLocation;
    self.mapView.zoom = 13;

    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
    
//    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;

    RMAnnotation *annotation = [[RMAnnotation alloc]initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake([self.infos[@"location"][@"latitude"] doubleValue], [self.infos[@"location"][@"longitude"] doubleValue]) andTitle:self.infos[@"location"][@"placeName"]];
    annotation.annotationIcon = [UIImage imageNamed:@"map-pin.png"];
    annotation.anchorPoint = CGPointMake(0.5, 1.0);
    annotation.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                           nil];
    [self.mapView addAnnotation:annotation];

//    CLLocationCoordinate2D zoomLocation;
//    zoomLocation.latitude= [self.infos[@"location"][@"latitude"] doubleValue];
//    zoomLocation.longitude= [self.infos[@"location"][@"longitude"] doubleValue];
//    
//    AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] init:zoomLocation];
//    addAnnotation.myTitle = self.infos[@"location"][@"placeName"];
//    [self.map addAnnotation:addAnnotation];
//    
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(zoomLocation, 1*METERS_PER_MILE, 1*METERS_PER_MILE);
//    
//    [self.map setRegion:region animated:YES];
//
//    [self.view addSubview:self.map];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"quit");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation {
    if (annotation.isUserLocationAnnotation){
        NSLog(@"User's location pin");
        return nil;
    }
    NSLog(@"Real pin");
    RMMarker *marker = [[RMMarker alloc] initWithUIImage:[UIImage imageNamed:@"map-pin.png"] anchorPoint: CGPointMake(0.5, 1.0)];
//    marker.canShowCallout = YES;
    
//    marker.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return marker;
}


@end
