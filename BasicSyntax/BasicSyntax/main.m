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
        
        NSLog(@"Characters in Reverse");
        for (NSString *c in [characters reverseObjectEnumerator]) {
            NSLog(@"%@", c);
        }
        
        NSLog(@"Character at Index 1 %@", characters[1]);
        NSLog(@"Character at Index 0 %@", [characters objectAtIndex:0]);
        
        
    }
    return 0;
}
