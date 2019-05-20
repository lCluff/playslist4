//
//  LECPlaylist.h
//  Playlist4
//
//  Created by Leah Cluff on 5/20/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LECSong;

NS_ASSUME_NONNULL_BEGIN

@interface LECPlaylist : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong, readonly) NSArray* songs;


- (instancetype) initWithName:(NSString*)name songs:(NSArray*)songs;

- (void) addSongsObject:(LECSong *)object;
- (void) removeSongsObject:(LECSong *)object;


@end

NS_ASSUME_NONNULL_END
