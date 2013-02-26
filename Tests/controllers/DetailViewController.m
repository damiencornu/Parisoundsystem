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

    self.view.backgroundColor = [UIColor colorWithRed:0.90 green:0.32 blue:0.26 alpha:1];
    
    self.title = self.infos[@"title"];
//    NSLog(@"%@", self.infos);
    
    self.logo = [[UIButton alloc] init];
    self.logo.frame = CGRectMake(0, 0, self.view.frame.size.width, 49);
    [self.logo setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
    [self.logo setImage:[UIImage imageNamed:@"logo-active.jpg"] forState:UIControlStateSelected];
    [self.view addSubview:self.logo];
    
    self.backButton = [[UIButton alloc] init];
    self.backButton.frame = CGRectMake(10, 56, 54, 25);
    [self.backButton setTitle:@"BACK" forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"btn-back.jpg"] forState:UIControlStateNormal];
    [self.view addSubview:self.backButton];
    [self.backButton addTarget:self action:@selector(returnPreviousView:) forControlEvents:UIControlEventTouchUpInside];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 97, self.view.frame.size.width - 20, 52)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.text = self.infos[@"title"];
    [self.titleLabel setFont:[UIFont fontWithName:@"Executive-55Reg" size:32]];
    [self.view addSubview:self.titleLabel];
    
    self.artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 133, self.view.frame.size.width - 20, 40)];
    self.artistLabel.backgroundColor = [UIColor clearColor];
    self.artistLabel.textColor = [UIColor whiteColor];
    self.artistLabel.text = [NSString stringWithFormat:@"by %@", self.infos[@"artist"][@"name"]];
    [self.artistLabel setFont:[UIFont fontWithName:@"Executive-55Reg" size:32]];
    [self.view addSubview:self.artistLabel];
    
    UILabel *distance = [[UILabel alloc] initWithFrame:CGRectMake(10, 186, 300, 20)];
    distance.text = @"DISTANCE TO THAT SOUND";
    distance.backgroundColor = [UIColor clearColor];
    distance.textColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:121.0/255.0 alpha:1.0];
    [distance setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:distance];
    
    self.distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 186, 200, 20)];
    self.distanceLabel.text = @"123 m";
    self.distanceLabel.backgroundColor = [UIColor clearColor];
    self.distanceLabel.textColor = [UIColor whiteColor];
    [self.distanceLabel setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.distanceLabel setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:self.distanceLabel];
    
    UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(10, 206, 300, 20)];
    date.text = @"DATE";
    date.textColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:121.0/255.0 alpha:1.0];
    date.backgroundColor = [UIColor clearColor];
    [date setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:date];
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 206, 200, 20)];
    self.dateLabel.text = self.infos[@"date"];;
    self.dateLabel.textColor = [UIColor whiteColor];
    self.dateLabel.backgroundColor = [UIColor clearColor];
    [self.dateLabel setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.dateLabel setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:self.dateLabel];
    
    UILabel *duration = [[UILabel alloc] initWithFrame:CGRectMake(10, 226, 300, 20)];
    duration.text = @"DURATION";
    duration.textColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:121.0/255.0 alpha:1.0];
    duration.backgroundColor = [UIColor clearColor];
    [duration setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:duration];
    
    self.durationLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 226, 200, 20)];
    self.durationLabel.text = self.infos[@"duration"];;
    self.durationLabel.textColor = [UIColor whiteColor];
    self.durationLabel.backgroundColor = [UIColor clearColor];
    [self.durationLabel setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.durationLabel setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:self.durationLabel];
    
    UILabel *aboutPlace = [[UILabel alloc] initWithFrame:CGRectMake(10, 256, 300, 24)];
    aboutPlace.text = [NSString stringWithFormat:@"ABOUT %@", self.infos[@"title"]];
    aboutPlace.textColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:121.0/255.0 alpha:1.0];
    aboutPlace.backgroundColor = [UIColor clearColor];
    [aboutPlace setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:aboutPlace];
    
    self.aboutPlaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 276, self.view.frame.size.width - 20, 20)];
    self.aboutPlaceLabel.text = self.infos[@"about"];
    self.aboutPlaceLabel.textColor = [UIColor whiteColor];
    self.aboutPlaceLabel.backgroundColor = [UIColor clearColor];
    [self.aboutPlaceLabel setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:self.aboutPlaceLabel];
    
    UILabel *aboutArtist = [[UILabel alloc] initWithFrame:CGRectMake(10, 306, 300, 24)];
    aboutArtist.text = [NSString stringWithFormat:@"ABOUT %@", self.infos[@"artist"][@"name"]];
    aboutArtist.textColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:121.0/255.0 alpha:1.0];
    aboutArtist.backgroundColor = [UIColor clearColor];
    [aboutArtist setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:aboutArtist];
    
    self.aboutArtistLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 326, self.view.frame.size.width - 20, 90)];
    self.aboutArtistLabel.text = self.infos[@"artist"][@"about"];
    self.aboutArtistLabel.lineBreakMode = UILineBreakModeWordWrap;
    self.aboutArtistLabel.numberOfLines = 0;
    self.aboutArtistLabel.textColor = [UIColor whiteColor];
    self.aboutArtistLabel.backgroundColor = [UIColor clearColor];
    [self.aboutArtistLabel setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:self.aboutArtistLabel];
 
    UILabel *findHim = [[UILabel alloc] initWithFrame:CGRectMake(10, 426, 300, 24)];
    findHim.text = @"WHERE YOU CAN FIND HIM";
    findHim.textColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:121.0/255.0 alpha:1.0];
    findHim.backgroundColor = [UIColor clearColor];
    [findHim setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:findHim];
    
    self.linkButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 446, self.view.frame.size.width - 20, 20)];
    [self.linkButton setTitle:self.infos[@"artist"][@"website"] forState:UIControlStateNormal];
    [self.linkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.linkButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.linkButton.backgroundColor = [UIColor clearColor];
    [self.linkButton setTag:1];
    [self.linkButton setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.linkButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.linkButton];
    
    self.facebookButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 476, self.view.frame.size.width - 20, 20)];
    [self.facebookButton setTitle:@"Facebook"forState:UIControlStateNormal];
    [self.facebookButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.facebookButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.facebookButton.backgroundColor = [UIColor clearColor];
    [self.facebookButton setTag:2];
    [self.facebookButton setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.facebookButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.facebookButton];
    
    self.twitterButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 496, self.view.frame.size.width - 20, 20)];
    [self.twitterButton setTitle:@"Twitter" forState:UIControlStateNormal];
    [self.twitterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.twitterButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.twitterButton.backgroundColor = [UIColor clearColor];
    [self.twitterButton setTag:3];
    [self.twitterButton setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.twitterButton addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.twitterButton];
    
    
    // Initialize CoreLocationManager
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager startUpdatingLocation];
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

- (void) returnPreviousView:(UIButton *) sender {
    NSLog(@"Return previous view");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) openLink:(UIButton *) sender {
    NSLog(@"Open Link");
    NSString *url = @"";
    if ([sender tag] == 1) {
        url = self.infos[@"artist"][@"website"];
    }
    else if ([sender tag] == 2) {
        url = [NSString stringWithFormat:@"https://facebook.com/%@", self.infos[@"artist"][@"facebook"]];
    }
    else if ([sender tag] == 3) {
        url = [NSString stringWithFormat:@"https://mobile.twitter.com/%@", self.infos[@"artist"][@"twitter"]];
    }
    NSLog(@"%@", url);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: url]];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    CLLocation *infoLoc = [[CLLocation alloc] initWithLatitude:[self.infos[@"location"][@"latitude"] doubleValue] longitude:[self.infos[@"location"][@"longitude"] doubleValue]];
    CLLocationDistance distance = [infoLoc distanceFromLocation:newLocation];
    
    self.distanceLabel.text = [NSString stringWithFormat:@"%.0f m", distance];
}

@end
