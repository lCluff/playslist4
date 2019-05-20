//
//  LECDetailTableViewController.h
//  Playlist4
//
//  Created by Leah Cluff on 5/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LECPlaylist;

NS_ASSUME_NONNULL_BEGIN

@interface LECDetailTableViewController : UITableViewController

@property (nonatomic, strong) LECPlaylist *playlist;

@end

NS_ASSUME_NONNULL_END
