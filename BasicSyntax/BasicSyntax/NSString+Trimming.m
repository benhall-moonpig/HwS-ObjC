//
//  NSString+Trimming.m
//  BasicSyntax
//
//  Created by Ben Hall on 16/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import "NSString+Trimming.h"

#import <AppKit/AppKit.h>


@implementation NSString (Trimming)

- (NSString *)bh_stringByTrimming {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
