//
//  Post.m
//  ChaiOne Challenge
//
//  Created by Phil Brown on 3/26/13.
//  Copyright (c) 2013 Phil Brown. All rights reserved.
//

#import "App.h"

@implementation Post
{
    
}

+(Post *)postWithDictionary:(NSDictionary *)dictionary
{
    Post *post = [[Post alloc] init];
    post.canonical_url = [dictionary objectForKey:@"canonical_url"];
    post.created_at = [dictionary objectForKey:@"created_at"];
    post.entities = [dictionary objectForKey:@"entities"];
    post.html = [dictionary objectForKey:@"html"];
    post.identification = [dictionary objectForKey:@"id"];
    post.machine_only = [[dictionary objectForKey:@"machine_only"] boolValue];
    post.num_replies = [dictionary objectForKey:@"num_replies"];
    post.num_reposts = [dictionary objectForKey:@"num_reposts"];
    post.num_stars = [dictionary objectForKey:@"num_stars"];
    post.source = [Source sourceWithDictionary:[dictionary objectForKey:@"source"]];
    post.text = [dictionary objectForKey:@"text"];
    post.thread_id = [dictionary objectForKey:@"thread_id"];
    post.user = [User userWithDictionary:[dictionary objectForKey:@"user"]];
    
    return post;
}

@end

@implementation Source
{
    
}

+(Source *)sourceWithDictionary:(NSDictionary *)dictionary
{
    Source *source = [[Source alloc] init];
    source.client_id = [dictionary objectForKey:@"client_id"];
    source.link = [dictionary objectForKey:@"link"];
    source.name = [dictionary objectForKey:@"name"];
    
    return source;
}

@end


@implementation User
{
    
}

+(User *)userWithDictionary:(NSDictionary *)dictionary
{
    User *user = [[User alloc] init];
    NSDictionary *avatar_image = [dictionary objectForKey:@"avatar_image"];
    user.avatar_height = [avatar_image objectForKey:@"height"];
    user.avatar_url = [avatar_image objectForKey:@"url"];
    user.avatar_width = [avatar_image objectForKey:@"width"];
    
    user.canonical_url = [dictionary objectForKey:@"canonical_url"];
    
    NSDictionary *counts = [dictionary objectForKey:@"counts"];
    user.followers = [counts objectForKey:@"followers"];
    user.following = [counts objectForKey:@"following"];
    user.posts = [counts objectForKey:@"posts"];
    user.stars = [counts objectForKey:@"stars"];
    
    NSDictionary *cover_image = [dictionary objectForKey:@"cover_image"];
    user.cover_image_height = [cover_image objectForKey:@"height"];
    user.cover_image_url = [cover_image objectForKey:@"url"];
    user.cover_image_width = [cover_image objectForKey:@"width"];
    
    user.userSince = [dictionary objectForKey:@"created_at"];
    NSDictionary *description = [dictionary objectForKey:@"description"];
    user.description = [description objectForKey:@"text"];
    
    user.identification = [dictionary objectForKey:@"id"];
    user.name = [dictionary objectForKey:@"name"];
    user.type = [dictionary objectForKey:@"type"];
    user.username = [dictionary objectForKey:@"username"];
    
    return user;
}

@end

