//
//  SFApp.h
//  SciFiQuotes
//
//  Created by Ben Hall on 22/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFQuote.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFApp : NSObject

@property (atomic) NSMutableArray<SFQuote *> *quotes;

- (instancetype)initWithFile:(NSString*)filePath;

- (void)printQuote;

@end

NS_ASSUME_NONNULL_END
