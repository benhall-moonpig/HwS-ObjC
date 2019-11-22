//
//  SCApp.h
//  SwiftyCommits
//
//  Created by Ben Hall on 22/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCApp : NSObject

- (void)fetchCommitsForRepo:(NSString*)repo filteredByAuthor:(NSString*)authorFilter;

@end

NS_ASSUME_NONNULL_END
