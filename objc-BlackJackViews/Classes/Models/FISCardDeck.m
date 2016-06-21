//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Eldon Chan on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck

-(FISCard *) drawNextCard{
    
    if (self.remainingCards.count == 0){
        NSLog(@"DECK IS EMPTY!!!");
        return nil;
    }
    
    FISCard *drawFirstCard = self.remainingCards.firstObject;
    [self.dealtCards addObject:drawFirstCard];
    [self.remainingCards removeObjectAtIndex:0];
    return drawFirstCard;
}

-(void) resetDeck{
 
    [self gatherDealtCards];
    [self shuffleRemainingCards];
}

-(void) gatherDealtCards{
    
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
    
}

-(void) shuffleRemainingCards{
    
    NSMutableArray *pickUp = [self.remainingCards mutableCopy];
    
    for (NSUInteger i = 0; i < pickUp.count; i++){
        
        NSString *randomCard = pickUp[arc4random_uniform((uint32_t)i)];
        [self.remainingCards removeObject:randomCard];
        [self.remainingCards addObject:randomCard];
    }
}

-(void) makeStandardDeck {
    
    
    for (NSString *suits in [FISCard validSuits]){
        for (NSString *ranks in [FISCard validRanks]){
            
            FISCard *card = [[FISCard alloc]initWithSuit:suits rank:ranks];
            [self.remainingCards addObject:card];
            
        }
    }
}

-(instancetype)init{
    
    self = [super init];
    
    if (self){
        _remainingCards = [[NSMutableArray alloc]init];
        _dealtCards = [[NSMutableArray alloc]init];
        [self makeStandardDeck];
    }
    
    return self;
}

-(NSString *)description{
    
    return [NSString stringWithFormat:@"Count: %li \nCards: %@", self.remainingCards.count, self.remainingCards.description];
}

@end
