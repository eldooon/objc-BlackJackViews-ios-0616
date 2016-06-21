//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Eldon Chan on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

-(instancetype)init{
    
    self = [super init];
    
    if (self){
        
        FISCardDeck *newDeck = [[FISCardDeck alloc]init];
        FISBlackjackPlayer *house = [[FISBlackjackPlayer alloc]initWithName:@"House"];
        FISBlackjackPlayer *player = [[FISBlackjackPlayer alloc]initWithName:@"Player"];
        
        _deck = newDeck;
        _house = house;
        _player = player;
        
    }
    
    return self;
}

-(void)playBlackjack{

    
}

-(void)dealNewRound{
    
    FISCard *card = self.deck.drawNextCard;
    [self.player acceptCard:card];
    FISCard *card2 = self.deck.drawNextCard;
    [self.house acceptCard:card2];
    FISCard *card3 = self.deck.drawNextCard;
    [self.player acceptCard:card3];
    FISCard *card4 = self.deck.drawNextCard;
    [self.house acceptCard:card4];
}

-(void)dealCardToPlayer{
    
    FISCard *card = self.deck.drawNextCard;
    [self.player acceptCard:card];
    
}

-(void)dealCardToHouse{
    
    FISCard *card = self.deck.drawNextCard;
    [self.house acceptCard:card];

    
}

-(void)processPlayerTurn{
    
    if (self.player.stayed == NO &&
        self.player.busted == NO &&
        self.player.shouldHit == YES){
        FISCard *card = self.deck.drawNextCard;
        [self.player acceptCard:card];
    }
    
}

-(void)processHouseTurn{
    
    if (self.house.stayed == NO &&
        self.house.busted == NO &&
        self.house.shouldHit == YES){
        FISCard *card = self.deck.drawNextCard;
        [self.house acceptCard:card];
    }
    
}

-(BOOL)houseWins{
    
    if (self.house.busted == YES || self.house.handscore < self.player.handscore || (self.house.blackjack == YES && self.player.blackjack)){
        return NO;
    }
    
    if (self.player.busted == YES || self.house.handscore >= self.player.handscore){
        return YES;
    }
    
    return YES;
}

-(void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins{
    
    if (houseWins == YES){
        self.house.wins += 1;
        self.player.losses += 1;
    }
    
    else {
        self.player.wins += 1;
        self.house.losses += 1;
    }
    
    NSLog(@"House wins: %lu \nHouse losses: %lu \nPlayer wins: %lu \nPlayer losses: %lu", self.house.wins, self.house.losses, self.player.wins, self.player.losses);
}

@end
