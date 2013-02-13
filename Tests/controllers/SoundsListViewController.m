//
//  SoundsListViewController.m
//  Tests
//
//  Created by Damien CORNU on 24/12/12.
//  Copyright (c) 2012 Damien CORNU. All rights reserved.
//

#import "SoundsListViewController.h"
#import "DetailViewController.h"

@interface SoundsListViewController ()

@end

@implementation SoundsListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"Sounds";

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - audioPlayers' Stuffs
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"Finish playing");
    [timer invalidate];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d elements in plist", self.plistArray.count);
    return self.plistArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSMutableDictionary *cellInfos = [self.plistArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cellInfos[@"title"];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.infos = [self.plistArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
