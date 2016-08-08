//
//  PokemonMap.m
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import "PokemonMap.h"
#import "PokemonAnnotation.h"
#import "PokemonAnnotationView.h"
#import "Misc.h"
#import "Config.h"

@implementation PokemonMap

-(void)awakeFromNib {
    self.showsUserLocation = YES;
    self.delegate = self;
    
//    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    
    //
    // 16 WALKS
    //
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663625999999994, 9.1727);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.665175999999995, 9.1727);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.666726, 9.1727);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66827599999999, 9.1727);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663625999999994, 9.17425);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.665175999999995, 9.17425);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.666726, 9.17425);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66827599999999, 9.17425);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663625999999994, 9.1758);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.665175999999995, 9.1758);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.666726, 9.1758);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66827599999999, 9.1758);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663625999999994, 9.17735);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.665175999999995, 9.17735);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.666726, 9.17735);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66827599999999, 9.17735);
//    [self addAnnotation:annotation];
    
    //
    // 64 WALKS
    //
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6632665, 9.172349500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664041499999996, 9.172349500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6648165, 9.172349500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6655915, 9.172349500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6663665, 9.172349500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6671415, 9.172349500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6679165, 9.172349500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6686915, 9.172349500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6632665, 9.173124500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664041499999996, 9.173124500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6648165, 9.173124500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6655915, 9.173124500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6663665, 9.173124500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6671415, 9.173124500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6679165, 9.173124500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6686915, 9.173124500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6632665, 9.173899500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664041499999996, 9.173899500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6648165, 9.173899500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6655915, 9.173899500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6663665, 9.173899500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6671415, 9.173899500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6679165, 9.173899500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6686915, 9.173899500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6632665, 9.174674500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664041499999996, 9.174674500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6648165, 9.174674500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6655915, 9.174674500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6663665, 9.174674500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6671415, 9.174674500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6679165, 9.174674500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6686915, 9.174674500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6632665, 9.175449500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664041499999996, 9.175449500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6648165, 9.175449500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6655915, 9.175449500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6663665, 9.175449500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6671415, 9.175449500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6679165, 9.175449500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6686915, 9.175449500000001);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6632665, 9.176224500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664041499999996, 9.176224500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6648165, 9.176224500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6655915, 9.176224500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6663665, 9.176224500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6671415, 9.176224500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6679165, 9.176224500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6686915, 9.176224500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6632665, 9.1769995);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664041499999996, 9.1769995);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6648165, 9.1769995);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6655915, 9.1769995);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6663665, 9.1769995);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6671415, 9.1769995);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6679165, 9.1769995);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6686915, 9.1769995);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6632665, 9.177774500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664041499999996, 9.177774500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6648165, 9.177774500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6655915, 9.177774500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6663665, 9.177774500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6671415, 9.177774500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6679165, 9.177774500000002);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.6686915, 9.177774500000002);
//    [self addAnnotation:annotation];
    
    //
    // WALK 36
    //
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663263666666666, 9.172546666666666);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664297, 9.172546666666666);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66533033333333, 9.172546666666666);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66636366666667, 9.172546666666666);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.667397, 9.172546666666666);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66843033333333, 9.172546666666666);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663263666666666, 9.17358);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664297, 9.17358);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66533033333333, 9.17358);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66636366666667, 9.17358);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.667397, 9.17358);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66843033333333, 9.17358);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663263666666666, 9.174613333333332);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664297, 9.174613333333332);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66533033333333, 9.174613333333332);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66636366666667, 9.174613333333332);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.667397, 9.174613333333332);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66843033333333, 9.174613333333332);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663263666666666, 9.175646666666665);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664297, 9.175646666666665);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66533033333333, 9.175646666666665);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66636366666667, 9.175646666666665);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.667397, 9.175646666666665);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66843033333333, 9.175646666666665);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663263666666666, 9.17668);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664297, 9.17668);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66533033333333, 9.17668);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66636366666667, 9.17668);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.667397, 9.17668);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66843033333333, 9.17668);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.663263666666666, 9.177713333333331);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.664297, 9.177713333333331);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66533033333333, 9.177713333333331);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66636366666667, 9.177713333333331);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.667397, 9.177713333333331);
//    [self addAnnotation:annotation];
//    annotation = [[MKPointAnnotation alloc] init];
//    annotation.coordinate = CLLocationCoordinate2DMake(47.66843033333333, 9.177713333333331);
//    [self addAnnotation:annotation];
   
    
}


/**
 * This method adds a pokemon entry to this map, or updates its location it if it represents an existing entry.
 * It expects a dictioanry with certain values, namely:
 * - id:    A unique ID representing the pokemon
 * - pokemonNumber: The Pokedex number of the pokemon
 * - pokemonName: The canonical name of the pokemon that is shown to the user
 * - latitude: The latitude of the pokemon's position
 * - longitude: The longitude of the pokemon's position
 * - vanishesAt: The timestamp when the pokemon will be gone
 **/
-(void)addPokemon:(NSDictionary *)pokemonInfo {
    //Grab everything from the dictionary we expect there to be
//    int encounterID = [[pokemonInfo objectForKey:@"id"] intValue];
    PokemonAnnotation *annotation = [[PokemonAnnotation alloc] initWithPokemonInfo:pokemonInfo];
    
    NSLog(@"Adding Pokemon encounter %@", [annotation encounterID]);
    
    //Check if this pokemon encounter is already on the map
    //If so, we update the info and return
    for (PokemonAnnotation *existingAnnotation in self.annotations){
        if ([existingAnnotation isKindOfClass:[PokemonAnnotation class]] && [existingAnnotation isEqual:annotation]) {
            NSLog(@"DUPLICATE");
            [existingAnnotation setPokemonInfo:pokemonInfo];
            return;
        }
    }
    
    [self addAnnotation:annotation];
    
    //Schedule the removal of the pokemon when it vanishes
    NSTimeInterval delay = [[annotation vanishDate] timeIntervalSinceNow];
    [self performSelector:@selector(removePokemonAnnotation:) withObject:annotation afterDelay:delay];
}

-(void)removePokemonAnnotation:(PokemonAnnotation *)annotation {
    //For safety, we check if the pokemon actually vanished (or will in the next second)
    //If for some reason it didn't yet, we reschedule this method
    if ([[annotation vanishDate] timeIntervalSinceNow] < 1.0) {
        NSLog(@"REMOVED ENCOUNTER %@", [annotation encounterID]);
        [self removeAnnotation:annotation];
    } else {
        NSTimeInterval delay = [[annotation vanishDate] timeIntervalSinceNow];
        [self performSelector:@selector(removePokemonAnnotation:) withObject:annotation afterDelay:delay];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotationPoint
{
    if ([annotationPoint isKindOfClass:[PokemonAnnotation class]] == NO)
        return nil;
    
    PokemonAnnotationView *annotationView = [[PokemonAnnotationView alloc] initWithAnnotation:annotationPoint reuseIdentifier:nil];
    
    annotationView.canShowCallout = YES;
    
    return annotationView;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {    
    [self updateDistanceForSelectedAnnotations];
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    [self updateDistanceForSelectedAnnotations];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.userTrackingMode != MKUserTrackingModeNone) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setUserTrackingMode:MKUserTrackingModeNone animated:NO];
        });
    }
    
    [super touchesBegan:touches withEvent:event];
}

-(void)updateDistanceForSelectedAnnotations {
    for (MKPointAnnotation *selectedAnnotation in self.selectedAnnotations) {
        if ([selectedAnnotation isKindOfClass:[PokemonAnnotation class]] == NO) continue;
        
        PokemonAnnotation *pokemonAnnotation = (PokemonAnnotation *)selectedAnnotation;
        double distance = [Misc distanceBetweenCoordinate:self.userLocation.coordinate andCoordinate:pokemonAnnotation.coordinate];
        [pokemonAnnotation setDistanceToUser:distance];
    }
}

@end
