//
//  PokemonAnnotation.h
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface PokemonAnnotation : MKPointAnnotation

@property (readwrite, retain) NSDictionary *pokemonInfo;
@property (readwrite) double distanceToUser;

-(id)initWithPokemonInfo:(NSDictionary *)pokemonInfo;
-(NSString *)encounterID;
-(int)pokedexNumber;
-(NSDate *)vanishDate;
-(NSTimeInterval)timeUntilVanish;
-(UIImage *)pokemonSprite;

@end
