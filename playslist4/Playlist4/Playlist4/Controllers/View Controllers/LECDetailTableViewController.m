//
//  LECDetailTableViewController.m
//  Playlist4
//
//  Created by Leah Cluff on 5/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import "LECDetailTableViewController.h"
#import "LECPlaylist.h"
#import "LECSong.h"
#import "LECPlaylistController.h"

@interface LECDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@end

@implementation LECDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)addButtonTapped:(id)sender {
    
   [[LECPlaylistController sharedController] addSongWithTitle:self.titleTextField
    andArtist:self.artistTextField toPlaylist:self.playlist];
    [self.tableView reloadData];
    self.artistTextField.text = @"";
    self.titleTextField.text = @"";
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.playlist.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    
    LECSong *song = [self.playlist.songs objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [song title];
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
