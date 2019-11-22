//
//  SCApp.m
//  SwiftyCommits
//
//  Created by Ben Hall on 22/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import "SCApp.h"

@implementation SCApp

- (void)fetchCommitsForRepo:(NSString *)repo filteredByAuthor:(NSString *)authorFilter{
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/repos/%@/commits", repo];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    // Get data from URL
    NSError *requestError;
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&requestError];
    
    if (requestError) {
        NSLog(@"Fatal error 1: %@", [requestError localizedDescription]);
        exit(0);
    }
    
    // Parse data
    NSError *parsingError;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parsingError];
    
    if (parsingError) {
        NSLog(@"Fatal Error 2: %@", [parsingError localizedDescription]);
        exit(0);
    }
    
    for (NSDictionary *entry in json) {
        NSString *author = entry[@"commit"][@"author"][@"name"] ?: @"Anonymous";
        NSString *message = entry[@"commit"][@"message"];
        
        if (![authorFilter isEqualToString:@""]) {
            if (![author isEqualToString:authorFilter]) {
                continue;
            }
        }
        
        message = [message stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
        printf("%s: %s\n\n", [author cStringUsingEncoding:NSUTF8StringEncoding], [message cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

@end
