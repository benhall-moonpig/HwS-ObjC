//
//  Person.m
//  BasicSyntax
//
//  Created by Ben Hall on 16/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)printGreeting:(NSString*)greeting {
    NSLog(@"%@", greeting);
}

- (void)printGreetingTo:(NSString *)name atTimeOfDay:(NSString *)time {
    NSLog(@"Good %@, %@", time, name);
}


@end
