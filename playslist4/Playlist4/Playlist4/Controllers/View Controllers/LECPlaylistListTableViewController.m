//
//  LECPlaylistListTableViewController.m
//  Playlist4
//
//  Created by Leah Cluff on 5/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import "LECPlaylistListTableViewController.h"
#import "LECPlaylistController.h"
#import "LECDetailTableViewController.h"

@interface LECPlaylistListTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation LECPlaylistListTableViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    [[LECPlaylistController sharedController] createPlaylist:self.nameTextField.text];
    
    [self.tableView reloadData];
    self.nameTextField.text = @"";
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[LECPlaylistController sharedController] playlist] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    LECPlaylist *playlist = [[[LECPlaylistController sharedController] playlist]
                             objectAtIndex:indexPath.row];
    cell.textLabel.text = [playlist name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", playlist.songs.count];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"editPlaylistSegue"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        LECDetailTableViewController *destinationVC = [segue destinationViewController];
        LECPlaylist *playlist = [[[LECPlaylistController sharedController] playlist]
                                 objectAtIndex:indexPath.row];
        destinationVC.playlist = playlist;
        
    }
    
}


@end
