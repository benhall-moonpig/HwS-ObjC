//
//  main.m
//  Hangman
//
//  Created by Ben Hall on 15/11/2019.
//  Copyright © 2019 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>


void printWord(NSString *word, NSMutableSet<NSString *> *usedLetters) {
    printf("\nWord: ");
    
    // Missing letters tracking bool
    BOOL missingLetters = NO;
    
    // Check for if letters missing
    for (NSInteger i=0; i < [word length]; ++i) {
        unichar letter = [word characterAtIndex:i];
        NSString *letterString = [NSString stringWithFormat:@"%C", letter];
        
        if ([usedLetters containsObject:letterString]) {
            printf("%C", letter);
        } else {
            printf("_");
            missingLetters = YES; // Continue game
        }
    }
    
    // Game over or continue check
    printf("\nGuesses: %ld/8\n", [usedLetters count]);
    
    if (missingLetters == NO) {
        // Game Over
        printf("Well done! You get to guess another day!\n");
        exit(0);
    }
    
    if ([usedLetters count] == 8) {
        // Out of guesses!
        printf("Oops, the hangman cometh! The word was %s.\n", [word cStringUsingEncoding:NSUTF8StringEncoding]);
        exit(0);
    }
     
    // Game is still going!
    printf("Enter a letter: ");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *word = @"RHYTHM";
        //NSMutableArray<NSString*> *usedLetters = [NSMutableArray arrayWithCapacity:8];
        NSMutableSet<NSString*> *usedLetters = [NSMutableSet setWithCapacity:26];
        
        printf("Welcome to Hangman!\n");
        printf("Press a letter to guess, or Ctrl+C to quit.\n");
        
        while(1) {
            // Read cstring from user
            char cstring[256];
            scanf("%s", cstring);
            
            // Convert to NSString for use here
            NSString *input = [NSString stringWithCString:cstring encoding:NSUTF8StringEncoding];
            
            if ([input length] != 1) {
                printf("Please type exactly one letter, or Ctrl+C to quit.");
            } else {
                // Read first unichar character in converted NSString input
                unichar letter = [input characterAtIndex:0];
                // Convert to uppercase NSString
                NSString *upperCasedLetter = [[NSString stringWithFormat:@"%C", letter] uppercaseString];
                // Check to see if letter exists
                BOOL letterHasBeenUsed = [usedLetters containsObject:upperCasedLetter];
                // If exists - print warning
                if (letterHasBeenUsed) {
                    printf("This letter has already been used. Please try another one!\n");
                } else { // Else add letter
                    [usedLetters addObject:upperCasedLetter];
                }
            }
            // Print the game state
            printWord(word, usedLetters);
        }
    }
    return 0;
}
