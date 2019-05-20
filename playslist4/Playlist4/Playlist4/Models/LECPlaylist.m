//
//  LECPlaylist.m
//  Playlist4
//
//  Created by Leah Cluff on 5/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import "LECPlaylist.h"

@interface LECPlaylist()

@property(nonatomic, strong) NSMutableArray* internalSongs;

@end

@implementation LECPlaylist

- (instancetype) initWithName:(NSString *)name songs:(NSArray *)songs
{
    self = [super init];
    if (self){
        _name = name;
        _internalSongs = [songs mutableCopy];
        
    }
    return self;
}

#pragma mark - Methods
-(void)addSongsObject:(LECSong *)object
{
    [self.internalSongs addObject:object];
}
-(void) removeSongsObject:(LECSong *)object
{
    [self.internalSongs removeObject:object];
}
-(NSArray *) songs
{
    return self.internalSongs;
}

@end
