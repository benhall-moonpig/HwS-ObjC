//
//  main.m
//  SciFiQuotes
//
//  Created by Ben Hall on 22/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SFApp.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *filePath = @"/Users/ben.hall/Code/src/Moonpig/HwS-ObjC/SciFiQuotes/quotes.txt";
        NSFileManager *fileManager = [NSFileManager defaultManager];

        if ([fileManager fileExistsAtPath:filePath]) {
            SFApp *app = [[SFApp alloc] initWithFile:filePath];
            [app printQuote];
        } else {
            NSLog(@"File quotes.txt does not exist at expected path.");
            exit(1);
        }

    }
    return 0;
}
