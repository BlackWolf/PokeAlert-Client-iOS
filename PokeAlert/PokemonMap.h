//
//  PokemonMap.h
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface PokemonMap : MKMapView <MKMapViewDelegate>

-(void)addPokemon:(NSDictionary *)pokemonInfo;

@end
