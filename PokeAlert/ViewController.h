//
//  ViewController.h
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PokemonMap.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet PokemonMap *map;
@property (weak, nonatomic) IBOutlet UIButton *gpsButton;

- (IBAction)gpsButtonPressed:(id)sender;
- (IBAction)settingsCloseButtonPressed:(id)sender;

-(void)addPokemonToMap:(NSDictionary *)pokemonInfo;

-(void)checkPauseLocationUpdates;

@end

