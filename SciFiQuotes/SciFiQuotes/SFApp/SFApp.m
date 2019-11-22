//
//  SFApp.m
//  SciFiQuotes
//
//  Created by Ben Hall on 22/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import "SFApp.h"

@implementation SFApp

- (instancetype) initWithFile:(NSString*)filePath {
    if (self = [super init]) {
        NSLog(@"Attempting to init with file at path:\n%@", filePath);
        
        NSError *error;
        NSString *rawFileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        
        if (error) {
            NSLog(@"Fatal error: %@", [error localizedDescription]);
            exit(0);
        }
        
        self.quotes = [self parseQuotesFromRawFileContents:rawFileContents];
        
    }
    
    return self;
}

- (NSMutableArray<SFQuote*>*)parseQuotesFromRawFileContents:(NSString*)rawFileContents {
    
    NSArray *lines = [rawFileContents componentsSeparatedByString:@"\n"];
    
    NSMutableArray *tempQuotes = [NSMutableArray arrayWithCapacity:[lines count]];
    
    for (NSString *line in lines) {
        SFQuote *quote = [[SFQuote alloc] initWithLine:line];
        if (quote) {
            [tempQuotes addObject:quote];
        }
    }
    
    return tempQuotes;
}

- (void) printQuote {
    NSInteger randomIndex = arc4random_uniform((uint32_t)[self.quotes count]);
    SFQuote *quote = self.quotes[randomIndex];
    printf("%s\n", [quote.quote cStringUsingEncoding:NSUTF8StringEncoding]);
    printf("\t - %s\n", [quote.person cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
