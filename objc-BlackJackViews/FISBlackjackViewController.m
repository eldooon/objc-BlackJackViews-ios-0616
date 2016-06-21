//
//  FISBlackjackViewController.m
//  objc-BlackJackViews
//
//  Created by Eldon Chan on 6/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackViewController.h"

@interface FISBlackjackViewController ()
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

@property (weak, nonatomic) IBOutlet UILabel *houseLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseStayedLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseScoredLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseCard1Label;
@property (weak, nonatomic) IBOutlet UILabel *houseCard2Label;
@property (weak, nonatomic) IBOutlet UILabel *houseCard3Label;
@property (weak, nonatomic) IBOutlet UILabel *houseCard4Label;
@property (weak, nonatomic) IBOutlet UILabel *houseCard5Label;
@property (weak, nonatomic) IBOutlet UILabel *houseWinsLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseLossesLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseBustedLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseBlackjackLabel;

@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerStayedLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerScoredLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerCard1Label;
@property (weak, nonatomic) IBOutlet UILabel *playerCard2Label;
@property (weak, nonatomic) IBOutlet UILabel *playerCard3Label;
@property (weak, nonatomic) IBOutlet UILabel *playerCard4Label;
@property (weak, nonatomic) IBOutlet UILabel *playerCard5Label;
@property (weak, nonatomic) IBOutlet UILabel *playerWinsLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerLossesLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerBustedLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerBlackjackLabel;

@property (weak, nonatomic) IBOutlet UIButton *hitButton;
@property (weak, nonatomic) IBOutlet UIButton *stayButton;

@end

@implementation FISBlackjackViewController

- (IBAction)dealButtonTapped:(id)sender {
    
    self.game = [[FISBlackjackGame alloc]init];
    
    //reset deck and deal new round
    [self.game.deck resetDeck];
    [self.game dealNewRound];
    [self.playerCard3Label setHidden:YES];
    [self.playerCard4Label setHidden:YES];
    [self.playerCard5Label setHidden:YES];
    [self.houseCard3Label setHidden:YES];
    [self.houseCard4Label setHidden:YES];
    [self.houseCard5Label setHidden:YES];
    [self.playerBustedLabel setHidden:YES];
    [self.playerBlackjackLabel setHidden:YES];
    [self.houseBustedLabel setHidden:YES];
    [self.houseBlackjackLabel setHidden:YES];
    [self.winnerLabel setHidden:YES];
    
    //Unhide first 2 card for both player and house.
    [self.playerCard1Label setHidden:NO];
    [self.playerCard2Label setHidden:NO];
    [self.houseCard1Label setHidden:NO];
    [self.houseCard2Label setHidden:NO];
    [self.playerScoredLabel setHidden:NO];
    [self.houseScoredLabel setHidden:NO];
    
    //grab FIScard from cards in hand for players.
    FISCard *playerCard1 = self.game.player.cardsInHand[0];
    FISCard *playerCard2 = self.game.player.cardsInHand[1];
        
    self.playerCard1Label.text = playerCard1.cardLabel;
    self.playerCard2Label.text = playerCard2.cardLabel;
    
    //grab FIScard from cards in hand for house.
    FISCard *houseCard1 = self.game.house.cardsInHand[0];
    FISCard *houseCard2 = self.game.house.cardsInHand[1];
    
    self.houseCard1Label.text = houseCard1.cardLabel;
    self.houseCard2Label.text = houseCard2.cardLabel;
    
    //update if black jack
    if (self.game.house.blackjack == YES){
        [self.houseBlackjackLabel setHidden:NO];
        [self.winnerLabel setHidden:NO];
        self.winnerLabel.text = @"House Wins";
    }
    
    if (self.game.player.blackjack == YES){
        [self.playerBlackjackLabel setHidden:NO];
        [self.winnerLabel setHidden:NO];
        self.winnerLabel.text = @"Player Wins";
    }

    //update player and house score label
    self.playerScoredLabel.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
    self.houseScoredLabel.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
    
    //enable both hit and stay button
    [self.hitButton setEnabled:YES];
    [self.stayButton setEnabled:YES];
    
    
}
- (IBAction)playerHitButtonTapped:(id)sender {

    
    NSLog(@"%@", self.game.player.cardsInHand);
    
    //hit for 3rd card
    if (self.game.player.cardsInHand.count == 2){
        [self.game dealCardToPlayer];
        [self.playerCard3Label setHidden:NO];
        FISCard *playerCard3 = self.game.player.cardsInHand[2];
        self.playerCard3Label.text = playerCard3.cardLabel;
        self.playerScoredLabel.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
        
        if (self.game.player.busted == YES){
            [self.playerBustedLabel setHidden:NO];
            [self.winnerLabel setHidden:NO];
            self.winnerLabel.text = @"House Wins";
        }
    }
    
    //hit for 4th card
    else if (self.game.player.cardsInHand.count == 3){
        [self.game dealCardToPlayer];
        [self.playerCard4Label setHidden:NO];
        FISCard *playerCard4 = self.game.player.cardsInHand[3];
        self.playerCard4Label.text = playerCard4.cardLabel;
        self.playerScoredLabel.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
        
        if (self.game.player.busted == YES){
            [self.playerBustedLabel setHidden:NO];
            [self.winnerLabel setHidden:NO];
            self.winnerLabel.text = @"House Wins";
        }
 
    }
    
    //hit for 5th card
    else if (self.game.player.cardsInHand.count == 4){
        [self.game dealCardToPlayer];
        [self.playerCard5Label setHidden:NO];
        FISCard *playerCard5 = self.game.player.cardsInHand[4];
        self.playerCard5Label.text = playerCard5.cardLabel;
        self.playerScoredLabel.text = [NSString stringWithFormat:@"%lu", self.game.player.handscore];
        
        if (self.game.player.busted == YES){
            [self.playerBustedLabel setHidden:NO];
            [self.winnerLabel setHidden:NO];
            self.winnerLabel.text = @"House Wins";
        }
    
    }
    
    //if there is already 5 cards in hand.
    else {
        NSLog(@"MAX AMOUNT OF CARDS");
    }
}

- (IBAction)playerStayedButtonTapped:(id)sender {
    
    self.game.player.stayed = YES;
    [self.hitButton setEnabled:NO];
    [self.stayButton setEnabled:NO];
    
//    while (self.game.player.shouldHit == YES) {
    
        
        if (self.game.player.cardsInHand.count == 2){
            [self.game dealCardToHouse];
            [self.houseCard3Label setHidden:NO];
            FISCard *houseCard3 = self.game.house.cardsInHand[2];
            self.houseCard3Label.text = houseCard3.cardLabel;
            self.houseScoredLabel.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
            
            if (self.game.house.busted == YES){
                [self.houseBustedLabel setHidden:NO];
                [self.winnerLabel setHidden:NO];
                self.winnerLabel.text = @"Player Wins";
            }
        
        }
    
    //hit for 4th card
        else if (self.game.player.cardsInHand.count == 3){
            [self.game dealCardToHouse];
            [self.houseCard3Label setHidden:NO];
            FISCard *houseCard4 = self.game.house.cardsInHand[3];
            self.houseCard4Label.text = houseCard4.cardLabel;
            self.houseScoredLabel.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
            
            if (self.game.house.busted == YES){
                [self.houseBustedLabel setHidden:NO];
                [self.winnerLabel setHidden:NO];
                self.winnerLabel.text = @"Player Wins";
            }
            
        }
    
    //hit for 5th card
        else if (self.game.player.cardsInHand.count == 4){
            [self.game dealCardToHouse];
            [self.houseCard5Label setHidden:NO];
            FISCard *houseCard5 = self.game.house.cardsInHand[4];
            self.houseCard5Label.text = houseCard5.cardLabel;
            self.houseScoredLabel.text = [NSString stringWithFormat:@"%lu", self.game.house.handscore];
            
            if (self.game.house.busted == YES){
                [self.houseBustedLabel setHidden:NO];
                [self.winnerLabel setHidden:NO];
                self.winnerLabel.text = @"Player Wins";
                
            }
        
        }
    
        else {
           NSLog(@"MAX AMOUNT OF CARDS");
        }
//    }

    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
