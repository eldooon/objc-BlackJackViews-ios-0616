//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by Eldon Chan on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"

@interface FISCard ()

@property (strong, nonatomic, readwrite) NSString *suit;
@property (strong, nonatomic, readwrite) NSString *rank;
@property (strong, nonatomic, readwrite) NSString *cardLabel;
@property (nonatomic, readwrite) NSUInteger cardValue;

@end

@implementation FISCard

+(NSArray *)validSuits{
    
    NSArray *suitsValid = @[@"\u2660", @"\u2665", @"\u2663", @"\u2666"]; //@"♠",@"♥",@"♣",@"♦"
    return suitsValid;
}

+(NSArray *)validRanks{
    
    NSArray *rankingOfCards = @[ @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return rankingOfCards;
}

-(instancetype)init{
    
    return self = [self initWithSuit:@"!" rank:@"N"];
    
}
-(instancetype)initWithSuit:(NSString *)suit
                       rank:(NSString *)rank{
    
    self = [super init];
    
    if (self){
        _suit = suit;
        _rank = rank;
        _cardLabel = [NSString stringWithFormat:@"%@%@", suit, rank];
        
        if ([rank isEqualToString:@"J"] ||
            [rank isEqualToString:@"Q"] ||
            [rank isEqualToString:@"K"]){
            _cardValue = 10;
        }
        
        else if ([rank isEqualToString:@"A"]){
            _cardValue = 1;
        }
        
        else {
            _cardValue = rank.integerValue;
        }
    
    }
    
    return self;
}

-(NSString *)description{
    
    return [NSString stringWithFormat:@"%@%@", self.suit, self.rank];
}




@end


