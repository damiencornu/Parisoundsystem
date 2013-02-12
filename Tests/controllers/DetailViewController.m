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
    [self.logo setSelected:YES];
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
    
    UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(10, 206, 300, 20)];
    date.text = @"DATE";
    date.textColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:121.0/255.0 alpha:1.0];
    date.backgroundColor = [UIColor clearColor];
    [date setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:date];
    
    UILabel *duration = [[UILabel alloc] initWithFrame:CGRectMake(10, 230, 300, 20)];
    duration.text = @"DURATION";
    duration.textColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:121.0/255.0 alpha:1.0];
    duration.backgroundColor = [UIColor clearColor];
    [duration setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:duration];
    
    UILabel *about = [[UILabel alloc] initWithFrame:CGRectMake(10, 264, 300, 24)];
    about.text = [NSString stringWithFormat:@"ABOUT %@", self.infos[@"title"]];
    about.textColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:121.0/255.0 alpha:1.0];
    about.backgroundColor = [UIColor clearColor];
    [about setFont:[UIFont fontWithName:@"Executive-55Reg" size:14]];
    [self.view addSubview:about];
    
    
//    UILabel *locationTitle = [[UILabel alloc] init];
//    locationTitle.frame = CGRectMake(10, 10, self.view.frame.size.width - 20, 16);
//    locationTitle.text = [NSString stringWithFormat:@"Location: %@", self.infos[@"location"] [@"placeName"]];
//    [self.view addSubview:locationTitle];
    
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

@end
