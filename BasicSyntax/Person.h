//
//  Person.h
//  BasicSyntax
//
//  Created by Ben Hall on 16/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)printGreeting:(NSString*)greeting;

- (void)printGreetingTo:(NSString*)name atTimeOfDay:(NSString*)time;

@end

NS_ASSUME_NONNULL_END
