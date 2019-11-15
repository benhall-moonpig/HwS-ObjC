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
        
        // Sorting
        NSArray *sortedVillains = [[[villains reverseObjectEnumerator] allObjects] sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"%@", [sortedVillains componentsJoinedByString:@", "]);
        
        // Functional Approach
        // Foreach ish
        
        // Block
        NSArray *intArray = @[@1, @2, @3];
        NSLog(@"%@", intArray);
        [intArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"%ld", (long)[obj intValue] * 2);
        }];
        
        NSArray *moreVillains = @[@"Darth Vader", @"Snoke", @"Palpatine", @"Jar Jar Binks", @"Kylo"];
        NSLog(@"Searching for the true Star Wars evil mastermind:");
        [moreVillains enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isEqualToString:@"Jar Jar Binks"]) {
                NSLog(@"%@ is the real evil mastermind. Stopping the search.", obj);
                *stop=YES;
            } else {
                NSLog(@"%@ just a minor sub-villain", obj);
            }
        }];
        
        // Predicate (like .filter())
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id obj, NSDictionary *bindings) {
            return [[obj componentsSeparatedByString:@" "] count] > 1;
        }];
        
        NSArray *twoWordVillains = [moreVillains filteredArrayUsingPredicate:predicate];
        NSLog(@"Villains with multiple word names: %@", [twoWordVillains componentsJoinedByString:@", "]);
        
        // Key Paths
        NSArray *numbers = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil];
        NSNumber *sum = [numbers valueForKeyPath:@"@sum.self"];
        NSNumber *avg = [numbers valueForKeyPath:@"@avg.self"];
        NSNumber *min = [numbers valueForKeyPath:@"@min.self"];
        NSNumber *max = [numbers valueForKeyPath:@"@max.self"];
        NSLog(@"Total: %ld", (long)[sum integerValue]);
        NSLog(@"Avg: %ld", (long)[avg integerValue]);
        NSLog(@"Min: %ld", (long)[min integerValue]);
        NSLog(@"Max: %ld", (long)[max integerValue]);
        
#pragma mark Dictionaries
        // Immutable Dictionaries
        NSDictionary *saberColours = @{
            @"Blue": @[@"Padawan Anakin", @"Padawan Luke", @"Obi-Wan Kenobi", @"Rey"],
            @"Green": @[@"Yoda", @"Qui-Gon Ginn", @"Jedi Master Luke"],
            @"Red": @[@"Emperor Palpatine", @"Darth Vader", @"Kylo Ren", @"Count Dooku", @"Darth Maul"],
            @"Purple": @[@"Mace Windu"]
        };
        
        for (NSString *key in saberColours) {
            NSString *forceParty = [[key lowercaseString] isEqualToString:@"red"] ? @"Dark" : @"Light";
            NSLog(@"These Characters are powerful with the %@ side of the force:\n%@", forceParty, [saberColours[key] componentsJoinedByString:@", "]);
        }
        
        // Mutable Dictionaries
        NSMutableDictionary *saberColours2 = [saberColours mutableCopy];
        [saberColours2 removeObjectForKey:@"Purple"];
        for (NSString *key in saberColours) {
            NSString *forceParty = [[key lowercaseString] isEqualToString:@"red"] ? @"Dark" : @"Light";
            NSLog(@"These Characters are powerful with the %@ side of the force:\n%@", forceParty, [saberColours[key] componentsJoinedByString:@", "]);
        }
    }
    
#pragma mark  Sets
    // Immutable
    NSSet *exampleSet = [NSSet setWithObjects:@1, @2, @3, @4, nil];
    NSLog(@"\nImutable set contains %ld entries:\n%@", (long)[exampleSet count], [exampleSet allObjects]);
    
    // Mutable
    NSMutableSet *exampleMutableSet = [NSMutableSet setWithObjects:@1, @2, @3, @4, nil];
    [exampleMutableSet addObject:@5];
    NSLog(@"\nMutable set contains %ld entries:\n%@", (long)[exampleMutableSet count], [exampleMutableSet allObjects]);
    NSCountedSet *exampleCountedSet = [NSCountedSet setWithObjects:@1, @2, @3, @4, nil];
    [exampleCountedSet addObjectsFromArray:@[@1, @1, @4]];
    NSLog(@"\nValue 1 appears in the counted set %ld times", (long)[exampleCountedSet countForObject:@1]);
    
#pragma mark Generics
    // This should work?
//    NSArray<NSNumber *> *numbers = @[@42, @556, @69, @3.141592];
//    for (NSString *number in numbers) {
//        NSLog(@"%@ is %ld letters.", number, [number length]);
//    }
    
    NSDictionary<NSString *, NSNumber *> *genericDictionary = @{
        @"Key": @42
    };
    NSLog(@"\nGenericDictionary:\n%@", genericDictionary);
    
#pragma mark NSValue
    // Allows storing structs (eg. CGRect, CGSize, CGPoint) in arrays)
    NSValue *rect = [NSValue valueWithRect:NSMakeRect(0, 0, 0, 0)];
    NSLog(@"%@", rect);
    
    
    return 0;
}
