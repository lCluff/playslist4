//
//  LECPlaylistController.m
//  Playlist4
//
//  Created by Leah Cluff on 5/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import "LECPlaylistController.h"

@interface LECPlaylistController()

@property (nonatomic, strong, readwrite) NSMutableArray* internalPlaylist;

@end

@implementation LECPlaylistController

+ (LECPlaylistController*)sharedController
{
    static LECPlaylistController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [LECPlaylistController new];
    });
    return sharedController;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalPlaylist = [[NSMutableArray alloc] init];
    }
    return self;
    
    NSArray *(playlist);
    {
        return self.internalPlaylist;
    }
}
-(void)createPlaylist:(NSString *)name

{
    LECPlaylist *newPlaylist = [[LECPlaylist alloc] initWithName:name
    songs:[NSMutableArray new]];
    
    [self.internalPlaylist addObject:newPlaylist];
}

-(void)deletePlaylist:(LECPlaylist *)playlist

{
    [self.internalPlaylist removeObject:playlist];
}

-(void)addSongWithTitle:(NSString *)title andArtist:(NSString *)artist toPlaylist:(LECPlaylist *)playlist

{
    LECSong * newSong = [[LECSong alloc] initWithTitle:title artist:artist];
    [playlist addSongsObject:newSong];
}

-(void)removeSong:(LECSong *)song fromPlaylist:(LECPlaylist *)playlist

{
    [playlist removeSongsObject:song];
}

@end
