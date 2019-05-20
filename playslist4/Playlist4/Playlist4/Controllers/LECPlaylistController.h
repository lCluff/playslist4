//
//  LECPlaylistController.h
//  Playlist4
//
//  Created by Leah Cluff on 5/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LECPlaylist.h"
#import "LECSong.h"

NS_ASSUME_NONNULL_BEGIN


@interface LECPlaylistController : NSObject


@property (nonatomic, strong, readonly) NSArray* playlist;

+ (LECPlaylistController *) sharedController;

// create
-(void) createPlaylist:(NSString*)name;

// delete
-(void) deletePlaylist:(LECPlaylist *)playlist;

// add song
-(void) addSongWithTitle:(NSString *)title andArtist:(NSString*)artist
              toPlaylist:(LECPlaylist*)playlist;

// remove song

- (void) removeSong:(LECSong*)song fromPlaylist:(LECPlaylist*)playlist;

@end

NS_ASSUME_NONNULL_END
