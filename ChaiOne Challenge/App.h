//
//  Post.h
//  ChaiOne Challenge
//
//  Created by Phil Brown on 3/26/13.
//  Copyright (c) 2013 Phil Brown. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * Defines a Post Source
 */
@interface Source : NSObject
{
    
}

@property (nonatomic, strong) NSString *client_id;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *name;

+(Source *)sourceWithDictionary:(NSDictionary *)dictionary;

@end


/**
 * Defines an App.net User
 */
@interface User : NSObject
{
    
}

@property (nonatomic, strong) NSNumber *avatar_height;
@property (nonatomic, strong) NSNumber *avatar_width;
@property (nonatomic, strong) NSString *avatar_url;

@property (nonatomic, strong) NSString *canonical_url;
@property (nonatomic, strong) NSNumber *followers;
@property (nonatomic, strong) NSNumber *following;
@property (nonatomic, strong) NSNumber *posts;
@property (nonatomic, strong) NSNumber *stars;

@property (nonatomic, strong) NSNumber *cover_image_height;
@property (nonatomic, strong) NSNumber *cover_image_width;
@property (nonatomic, strong) NSString *cover_image_url;

@property (nonatomic, strong) NSString *userSince;
@property (nonatomic, strong) NSString *description;

@property (nonatomic, strong) NSString *identification;
@property (nonatomic, strong) NSString *name;
/** Human vs robot. */
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *username;


+(User *)userWithDictionary:(NSDictionary *)dictionary;

@end

/**
 * Defines a App.net Post
 */
@interface Post : NSObject
{
    
}

@property (nonatomic, strong) NSString *canonical_url;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSDictionary *entities;
@property (nonatomic, strong) NSString *html;
@property (nonatomic, strong) NSString *identification;
@property (nonatomic) BOOL machine_only;
@property (nonatomic, strong) NSNumber *num_replies;
@property (nonatomic, strong) NSNumber *num_reposts;
@property (nonatomic, strong) NSNumber *num_stars;
@property (nonatomic, strong) Source *source;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *thread_id;
@property (nonatomic, strong) User *user;


+(Post *)postWithDictionary:(NSDictionary *)dictionary;

@end
