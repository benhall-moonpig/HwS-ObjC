//
//  Person.m
//  BasicSyntax
//
//  Created by Ben Hall on 16/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import "Person.h"

@interface Person ()
@property float height;
@end

@implementation Person

/* Property ivar synthesising name overrid
 
@synthesize age = personAge;

OR sometimes these:
@synthesize age; // "Synthesize the name property as name ivar". Really bad idea.
@synthesize age = _age; // "Synthesize the name property as the _name ivar". Common with custom getter and setter.

*/

@synthesize age = _age;

- (NSInteger)age {
    NSLog(@"Reading age!");
    return _age;
}

- (void)setAge:(NSInteger)newAge {
    NSLog(@"Writing age!");
    _age = newAge;
}

- (void)greetSelf {
    NSLog(@"Welcome, %@", name);
}

- (void)printGreeting:(NSString*)greeting {
    NSLog(@"%@", greeting);
}

- (void)printGreetingTo:(NSString *)name atTimeOfDay:(NSString *)time {
    NSLog(@"Good %@, %@", time, name);
}

- (void)printAge {
    // Dot syntax
    NSLog(@"%@ is age %ld", name, self.age);
    // Bracket syntax
    // NSLog(@"%@ is age %ld", name, [self age]);
    // Synthesised ivar syntax
    // NSLog(@"%@ is age %ld", name, _age);
    // Synthesised ivar syntax (with synthesised keyword in .m)
    // NSLog(@"%@ is age %ld", name, personAge);
}

+ (void)genericGreeting {
    NSLog(@"Hello World!");
}

#pragma mark Class property creation
static NSString *_species = @"Human";
+ (NSString *)species {
    return _species;
}
+ (void)setSpecies:(NSString *)species {
    _species = species;
}

#pragma mark Init
- (instancetype)initWithAge:(NSInteger)age {
    if (self = [super init]) {
        _age = age;
    }
    return self;
}

@end
