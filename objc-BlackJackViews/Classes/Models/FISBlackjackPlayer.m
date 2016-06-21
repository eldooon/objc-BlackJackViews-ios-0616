//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Eldon Chan on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer


-(instancetype)init{
    
    return self = [self initWithName:@""];
}

-(instancetype)initWithName:(NSString *)name{
    
    self = [super init];
    
    if(self){
        _name = name;
        _cardsInHand = [[NSMutableArray alloc]init];
        _handscore = 0;
        _wins = 0;
        _losses = 0;
        _aceInHand = NO;
        _blackjack = NO;
        _stayed = NO;
        _busted = NO;
        
    }
    
    return self;
}
-(void)resetForNewGame{
    
    [self.cardsInHand removeAllObjects];
    self.handscore = 0;
    self.aceInHand = NO;
    self.blackjack = NO;
    self.stayed = NO;
    self.busted = NO;
    
}

-(void)acceptCard:(FISCard *)card{
    
    [self.cardsInHand addObject: card];
    self.handscore += card.cardValue;


    for (FISCard *cardA in self.cardsInHand){
        
        if ([cardA.rank isEqual:@"A"]){
            self.aceInHand = YES;
            
            if (self.handscore <= 11){
                self.handscore += 10;
            }
        }
        
    }
    
    if (self.cardsInHand.count == 2 && self.handscore == 21){
        self.blackjack = YES;
    }
    
    if (self.handscore > 21){
        self.busted = YES;
    }

}

-(BOOL)shouldHit{
    
    if (self.handscore >= 17){
        self.stayed = YES;
        return NO;
    }
    
    return YES;
}

-(NSMutableString *)description{
    
    NSMutableString *descript = [[NSMutableString alloc]init];
    [descript appendFormat:@"name: %@", self.name];
    [descript appendFormat:@"\ncards: %@", self.cardsInHand];
    [descript appendFormat:@"\nhandscore : %lu", self.handscore];
    [descript appendFormat:@"\nace in hand : %d", self.aceInHand];
    [descript appendFormat:@"\nstayed : %d", self.stayed];
    [descript appendFormat:@"\nblackjack : %d", self.blackjack];
    [descript appendFormat:@"\nbusted : %d", self.busted];
    [descript appendFormat:@"\nwins : %lu", self.wins];
    [descript appendFormat:@"\nlosses : %lu", self.losses];
    
    return descript;
    
}

@end
