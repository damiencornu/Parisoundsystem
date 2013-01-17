//
//  LeftViewController.m
//  Tests
//
//  Created by Damien CORNU on 16/01/13.
//  Copyright (c) 2013 Damien CORNU. All rights reserved.
//

#import "LeftViewController.h"
#import "IIViewDeckController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

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
    
    self.applicationButton = [[UIButton alloc] init];
    self.applicationButton.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    [self.applicationButton setTitle:@"Application" forState:UIControlStateNormal];
    self.applicationButton.backgroundColor = [UIColor grayColor];
    [self.applicationButton addTarget:self
                 action:@selector(applicationCenterPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.applicationButton];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 1)];
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView];
    
    self.aboutButton = [[UIButton alloc] init];
    self.aboutButton.frame = CGRectMake(0, 41, self.view.frame.size.width, 40);
    [self.aboutButton setTitle:@"About" forState:UIControlStateNormal];
    self.aboutButton.backgroundColor = [UIColor grayColor];
    [self.aboutButton addTarget:self
                               action:@selector(aboutCenterPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.aboutButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle

- (IBAction)applicationCenterPressed:(id)sender {
    self.viewDeckController.centerController = SharedAppDelegate.tabBarController;
    self.viewDeckController.leftController = SharedAppDelegate.leftViewController;
    [self.viewDeckController closeLeftView];
}

- (IBAction)aboutCenterPressed:(id)sender {
    self.viewDeckController.centerController = SharedAppDelegate.aboutNavController;
    self.viewDeckController.leftController = SharedAppDelegate.leftViewController;
    [self.viewDeckController closeLeftView];
}


@end
