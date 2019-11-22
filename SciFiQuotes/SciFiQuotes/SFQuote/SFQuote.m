//
//  SFQuote.m
//  SciFiQuotes
//
//  Created by Ben Hall on 22/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import "SFQuote.h"

@implementation SFQuote: NSObject

- (instancetype)initWithLine:(NSString *)line {
    if (self = [super init]) {
        NSArray *lineSplitBySlashes = [line componentsSeparatedByString:@"/"];
        
        if ([lineSplitBySlashes count] != 2) {
            return nil;
        }
        
        self.quote = lineSplitBySlashes[0];
        self.person = lineSplitBySlashes[1];
    }
    
    return self;
}

@end
