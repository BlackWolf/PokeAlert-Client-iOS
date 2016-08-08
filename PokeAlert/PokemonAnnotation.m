//
//  PokemonAnnotation.m
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import "PokemonAnnotation.h"

@implementation PokemonAnnotation

//TODO
//It is probably more efficient to save all the pokemon infos to separate variables when the dictionary is set

//TODO
//We should have a class PokemonInfo that we create from the notification payload
//This class should also have a method "isValid" that checks if the info is valid

//TODO
//actually, some of the methods in here should probably be moved
//such as pokedex number and calculations such as vanishDate

-(id)initWithPokemonInfo:(NSDictionary *)pokemonInfo {
    if (self = [super init]) {
        self.pokemonInfo = pokemonInfo;
    }
    
    return self;
}
-(NSString *)encounterID {
    NSString *encounterID = [self.pokemonInfo objectForKey:@"id"];
    return encounterID;
}

-(int)pokedexNumber {
    int number = [[self.pokemonInfo objectForKey:@"pokemonNumber"] intValue];
    return number;
}

-(NSDate *)vanishDate {
    NSString *vanishTime = [self.pokemonInfo objectForKey:@"vanishesAt"];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setLocale:enUSPOSIXLocale];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    
    return [dateFormatter dateFromString:vanishTime];
}

-(NSTimeInterval)timeUntilVanish {
    return [[self vanishDate] timeIntervalSinceNow];
}

-(NSString *)title {
    NSString *pokemonName = [self.pokemonInfo objectForKey:@"pokemonName"];
    return pokemonName;
}

-(NSString *)subtitle {
    NSString *distanceString = [NSString stringWithFormat:@"%d %@", (int)self.distanceToUser, [self pluralize:@"meter" forNumber:(int)self.distanceToUser]];
    
    NSString *timeString = @"";
    
    int seconds = [self timeUntilVanish];
    
    if (seconds < 60) {
        timeString = @"less than a minute";
//        timeString = [NSString stringWithFormat:@"%d %@", seconds, [self pluralize:@"second" forNumber:seconds]];
    } else {
        int minutes = floor(seconds/60.0);
//        seconds = seconds - minutes*60;
        
//        timeString = [NSString stringWithFormat:@"%d %@, %d %@", minutes, [self pluralize:@"minute" forNumber:minutes], seconds, [self pluralize:@"second" forNumber:seconds]];
        timeString =[NSString stringWithFormat:@"%d %@", minutes, [self pluralize:@"minute" forNumber:minutes]];
    }
    
    return [NSString stringWithFormat:@"%@ – %@", distanceString, timeString];
}

-(UIImage *)pokemonSprite {
    NSString *imagePath = [NSString stringWithFormat:@"%d.png", [self pokedexNumber]];
    return [UIImage imageNamed:imagePath];
}

-(CLLocationCoordinate2D)coordinate {
    CLLocationDegrees latitude = [[self.pokemonInfo objectForKey:@"latitude"] floatValue];
    CLLocationDegrees longitude = [[self.pokemonInfo objectForKey:@"longitude"] floatValue];
    return CLLocationCoordinate2DMake(latitude, longitude);
}

-(NSString *)pluralize:(NSString *)string forNumber:(int)number {
    if (number == 1) return string;
    
    return [NSString stringWithFormat:@"%@s", string];
}

-(BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[PokemonAnnotation class]] == NO) return NO;
    
    PokemonAnnotation *otherAnnotation = (PokemonAnnotation *)object;
    
    return ([[self encounterID] isEqualToString:[otherAnnotation encounterID]]);
}


@end
