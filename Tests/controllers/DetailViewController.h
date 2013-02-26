//
//  DetailViewController.h
//  Tests
//
//  Created by Damien CORNU on 29/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DetailViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) NSDictionary *infos;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) UIButton *logo;
@property (strong, nonatomic) UIButton *backButton;

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *artistLabel;
@property (strong, nonatomic) UILabel *distanceLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *durationLabel;
@property (strong, nonatomic) UILabel *aboutPlaceLabel;
@property (strong, nonatomic) UILabel *aboutArtistLabel;
@property (strong, nonatomic) UIButton *linkButton;
@property (strong, nonatomic) UIButton *facebookButton;
@property (strong, nonatomic) UIButton *twitterButton;

@end
