//
//  DetailViewController.m
//  Tests
//
//  Created by Damien CORNU on 29/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import "DetailViewController.h"
#define METERS_PER_MILE 1609.344

@interface DetailViewController ()

@end

@implementation DetailViewController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.infos[@"title"];
    NSLog(@"%@", self.infos);

//    self.view.frame = [[UIScreen mainScreen] bounds];
    self.map = [[MKMapView alloc] init];
    self.map.frame = CGRectMake(0, 0, self.view.frame.size.width, 180);
    [self.map setMapType:MKMapTypeStandard];
//    self.map.showsUserLocation = YES;
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude= [self.infos[@"location"][@"latitude"] doubleValue];
    zoomLocation.longitude= [self.infos[@"location"][@"longitude"] doubleValue];
    
    AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] init:zoomLocation];
    addAnnotation.myTitle = self.infos[@"location"][@"placeName"];
    [self.map addAnnotation:addAnnotation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.3*METERS_PER_MILE, 0.3*METERS_PER_MILE);
    
    [self.map setRegion:region animated:YES];

    [self.view addSubview:self.map];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
