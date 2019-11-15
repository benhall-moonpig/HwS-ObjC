//
//  main.m
//  BasicSyntax
//
//  Created by Ben Hall on 15/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        
#pragma mark NSNumber
        NSNumber *doubleNum = @M_PI;
        NSNumber *intNum = @10;
        NSNumber *boolNum = @YES;
        
        NSLog(@"%3.2f", [doubleNum floatValue]);
        NSLog(@"%ld", (long)[intNum integerValue]);
        NSLog(@"%d", [boolNum intValue]);
        
#pragma mark Arrays
        NSArray *characters = @[@"Chewie", @"Han", @"Leia"];
        for (NSString *c in characters) {
            NSLog(@"%@", c);
        }
        
    }
    return 0;
}
