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
        
        // Immutable Arrays
        NSArray *heroes = @[@"Chewie", @"Han", @"Leia"];
        for (NSString *c in heroes) {
            NSLog(@"%@", c);
        }
        
        NSLog(@"Characters in Reverse");
        for (NSString *c in [heroes reverseObjectEnumerator]) {
            NSLog(@"%@", c);
        }
        
        // Indexing
        NSLog(@"Character at Index 1 %@", heroes[1]);
        NSLog(@"Character at Index 0 %@", [heroes objectAtIndex:0]);
        
        // Operations
        NSLog(@"Number of characters in array: %ld", (long)[heroes count]);
        NSLog(@"Index of Character 'Han' in character array is %ld", (long)[heroes indexOfObject:@"Han"]);
        NSLog(@"All characters in the array are: %@", [heroes componentsJoinedByString:@", "]);
        
        // Mutable Arrays
        NSMutableArray *villains = [@[@"Darth Vader", @"Palpatine", @"Snoke"] mutableCopy];
        NSLog(@"%@", [villains componentsJoinedByString:@", "]);
        
        [villains addObject:@"Kylo Ren"];
        NSLog(@"%@", [villains componentsJoinedByString:@", "]);
        
        [villains insertObject:@"Jar Jar Binks" atIndex:0];
        NSLog(@"%@", [villains componentsJoinedByString:@", "]);
        
        [villains removeObject:@"Darth Vader"];
        NSLog(@"%@", [villains componentsJoinedByString:@", "]);
        
        [villains removeLastObject];
        NSLog(@"%@", [villains componentsJoinedByString:@", "]);
        
        
        
    }
    return 0;
}
