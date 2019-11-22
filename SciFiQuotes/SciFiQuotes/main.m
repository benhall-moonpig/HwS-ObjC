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
        NSFileManager *fileManager = [NSFileManager defaultManager];

        while(YES) {
            printf("\nPlease enter location of quotes.txt file:\n");
            
            char cstring[256];
            scanf("%s", cstring);
            
            NSString *filePath = [NSString stringWithCString:cstring encoding:NSUTF8StringEncoding];
            
            if ([fileManager fileExistsAtPath:filePath]) {
                SFApp *app = [[SFApp alloc] initWithFile:filePath];
                [app printQuote];
                break;
            }
            printf("ERROR: File quotes.txt does not exist at expected path.");
        }
    }
    return 0;
}
