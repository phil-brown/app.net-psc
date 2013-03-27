//
//  ViewController.m
//  ChaiOne Challenge
//
//  Created by Phil Brown on 3/26/13.
//  Copyright (c) 2013 Phil Brown. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "SBJson.h"
#import "App.h"

@interface ViewController ()

@end

@implementation ViewController
{
    /**
     * Array of Post Objects to be shown in the cells
     */
    NSArray *data;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl setTintColor:[UIColor grayColor]];
    [refreshControl addTarget:self action:@selector(updateDataSource) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];
    
    [self updateDataSource];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Post *post = [data objectAtIndex:[indexPath row]];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Post"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Post"];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    //TODO:Swap out cell for custom, variable sized view. See http://code.google.com/p/tweetero/source/browse/trunk/Classes/MessageListController.m
    
    [[cell detailTextLabel] setText:[post text]];
    
    [[cell textLabel] setText:[[post user] username]];
    
    [[cell imageView] setImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[post user] avatar_url]]]]];
    cell.imageView.layer.cornerRadius = 10;
    cell.imageView.layer.borderWidth = 1;
    cell.imageView.layer.backgroundColor = [UIColor whiteColor].CGColor;
    cell.imageView.clipsToBounds = YES;
    
    return cell;
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
//    return cell.frame.size.height;
//}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

-(void)updateDataSource
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"]];
        
        //NSError *error = nil;
        
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary *response = [parser objectWithData:jsonData];
        
        //write to plist to debug with simulator
        NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [documentDirectories objectAtIndex:0];
        NSString *file = [documentDirectory stringByAppendingPathComponent:@"json.plist"];
        [response writeToFile:file atomically:YES];
        
        //Parse (I know what to parse based on the plist file)
        
        NSArray *_data = [response objectForKey:@"data"];
        NSMutableArray *posts = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in _data)
        {
            [posts addObject:[Post postWithDictionary:dict]];
        }
        
        /* dispatch back to the main queue for UI */
        dispatch_async(dispatch_get_main_queue(), ^{

            data = [NSArray arrayWithArray:posts];
            
            [self.tableView reloadData];
            
            [self.refreshControl endRefreshing];
        });
    });

    
    
}

@end
