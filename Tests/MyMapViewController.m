//
//  MyMapViewController.m
//  Tests
//
//  Created by Damien CORNU on 31/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import "MyMapViewController.h"
#define METERS_PER_MILE 1609.344

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
	self.map = [[MKMapView alloc] init];
    self.map.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.map setMapType:MKMapTypeHybrid];
    self.map.showsUserLocation = YES;
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude= 48.85788229770377;
    zoomLocation.longitude= 2.352275848388672;
    
    for(NSDictionary* infos in self.plistArray) {
        CLLocationCoordinate2D coordinates;
        coordinates.latitude = [infos[@"location"][@"latitude"] doubleValue];
        coordinates.longitude = [infos[@"location"][@"longitude"] doubleValue];
        AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] init:coordinates];
        addAnnotation.myTitle = infos[@"location"][@"placeName"];
        addAnnotation.mySubtitle = infos[@"title"];
        [self.map addAnnotation:addAnnotation];
    }

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(zoomLocation, 10*METERS_PER_MILE, 10*METERS_PER_MILE);
    
    [self.map setRegion:region animated:YES];
    
    [self.view addSubview:self.map];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
