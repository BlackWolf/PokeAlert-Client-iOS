//
//  PokemonAnnotationView.m
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import "PokemonAnnotationView.h"
#import "PokemonAnnotation.h"
#import "Misc.h"

@interface PokemonAnnotationView()

@property (readwrite, retain) NSTimer *refreshCalloutTimer;
@property (readwrite, retain) NSTimer *updateImageTimer;

@end

@implementation PokemonAnnotationView

-(id)initWithAnnotation:annotationPoint reuseIdentifier:annotationIdentifier {
    if (self = [super initWithAnnotation:annotationPoint reuseIdentifier:annotationIdentifier]) {
        [self addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
        
        //Based on the time until the pokemon vanishes, we make the image of this view more or less opaque
        //We update the icon about every 30 seconds, which should be enough
        self.updateImageTimer = [NSTimer scheduledTimerWithTimeInterval:30.0 target:self selector:@selector(updateImage) userInfo:nil repeats:YES];
        [self.updateImageTimer fire];
        [self updateImage];
    }
    
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"selected"]) {
        //Whenever the callout pop is shown (selected is YES), we start a timer that redraws this view about once a second
        //This is so the "time until vanish" updates live when the callout popup is open
        if ([self isSelected]) {
            if (self.refreshCalloutTimer == nil) {
                self.refreshCalloutTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(redraw) userInfo:nil repeats:YES];
                [self.refreshCalloutTimer fire];
            }
        } else {
            [self.refreshCalloutTimer invalidate];
            self.refreshCalloutTimer = nil;
        }
    }
}

-(void)updateImage {
    PokemonAnnotation *pokemonAnnotation = (PokemonAnnotation *)self.annotation;
    
    double timeUntilVanish = [pokemonAnnotation timeUntilVanish];
    
    double alpha = 1.0;
    if (timeUntilVanish < 10*60) {
        alpha = MAX(0.45, timeUntilVanish/(10*60));
    }
    
//    self.alpha = alpha;
    self.image = [Misc imageByApplyingAlpha:alpha toImage:[pokemonAnnotation pokemonSprite]];
}

-(void)redraw {
    //A dirty way of redrawing: We fake an update to the underlying annotation
    [self willChangeValueForKey:@"annotation"];
    [self didChangeValueForKey:@"annotation"];
}

@end
