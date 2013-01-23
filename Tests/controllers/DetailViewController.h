//
//  DetailViewController.h
//  Tests
//
//  Created by Damien CORNU on 29/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapBox/MapBox.h"

@interface DetailViewController : UIViewController <RMMapViewDelegate>

@property (strong) IBOutlet RMMapView *mapView;
@property (strong, nonatomic) NSDictionary *infos;
//@property (strong, nonatomic) CLLocationManager *locationManager;


@end
