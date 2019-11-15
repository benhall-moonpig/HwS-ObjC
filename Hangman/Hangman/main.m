//
//  main.m
//  Hangman
//
//  Created by Ben Hall on 15/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>


void printWord(NSString *word, NSMutableArray<NSString *> *usedLetters) {
    // Code
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *word = @"RHYTHM";
        NSMutableArray<NSString*> *usedLetters = [NSMutableArray arrayWithCapacity:8];
        
        printf("Welcome to Hangman!\n");
        printf("Press a letter to guess, or Ctrl+C to quit.\n");
        printWord(word, usedLetters);
    }
    return 0;
}
