//
//  main.m
//  SwiftyCommits
//
//  Created by Ben Hall on 22/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCApp.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *repo = @"apple/swift";
        NSString *author = @"";
        
        if (argc == 2) {
            repo = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
        } else if (argc == 3) {
            repo = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
            author = [NSString stringWithCString:argv[2] encoding:NSUTF8StringEncoding];
        }
        
        SCApp *app = [SCApp new];
        [app fetchCommitsForRepo:repo filteredByAuthor:author];
    }
    return 0;
}
