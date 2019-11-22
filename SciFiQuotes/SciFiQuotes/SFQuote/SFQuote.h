//
//  SFQuote.h
//  SciFiQuotes
//
//  Created by Ben Hall on 22/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFQuote : NSObject

@property NSString *quote;
@property NSString *person;

- (nullable instancetype)initWithLine:(NSString*)line;

@end

NS_ASSUME_NONNULL_END
