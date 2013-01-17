//
//  LeftViewController.h
//  Tests
//
//  Created by Damien CORNU on 16/01/13.
//  Copyright (c) 2013 Damien CORNU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController

@property (strong, nonatomic) UIButton *applicationButton;
@property (strong, nonatomic) UIButton *aboutButton;

- (IBAction)applicationCenterPressed:(id)sender;
- (IBAction)aboutCenterPressed:(id)sender;

@end
