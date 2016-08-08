//
//  SettingsViewController.m
//  PokeAlert
//
//  Created by Mario Schreiner on 26/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import "SettingsViewController.h"
#import "Config.h"

@implementation SettingsViewController

- (void)viewDidLoad {
    [self updateRadiusExplanation];
    [self updateRarityExplanation];
}

- (IBAction)radiusSegmentChanged:(id)sender {
    [self updateRadiusExplanation];
}

- (IBAction)raritySegmentChanged:(id)sender {
    [self updateRarityExplanation];
}

- (IBAction)enableSwitchChanged:(id)sender {
    UISwitch *enableSwitch = (UISwitch *)sender;
    
    NSString *url;
    if (enableSwitch.on) {
        url = [NSString stringWithFormat:@"%@/setenabled/1", SERVER_ADDRESS];
    } else {
        url = [NSString stringWithFormat:@"%@/setenabled/0", SERVER_ADDRESS];
    }
    
    if (url != nil) {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"POST"];
        [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
    
    //TODO
    //If we switch pokealert off, we can switch off GPS
    //also, when the app starts, we should pull the current settings from the server and set everything
    //we should have a central settings object that deals with this and delegates to different parts of the app
    //
    //TODO
    // have a force touch quick action to switch pokealerts on or off
}

-(void)updateRadiusExplanation {
    NSLog(@"Updating radius at %@", [NSDate date]);
    NSString *url;
    if (self.radiusSegmentedControl.selectedSegmentIndex == 0) {
        url = [NSString stringWithFormat:@"%@/forceradius/auto", SERVER_ADDRESS];
        
        self.radiusExplanationLabel.text = @"PokeAlert will automatically adjust the distance of pokemon searches. When staying somewhere (e.g. home, restaurant) you will only be notified of Pokemon catchable from your location.";
    }
    if (self.radiusSegmentedControl.selectedSegmentIndex == 1) {
        url = [NSString stringWithFormat:@"%@/forceradius/stationary", SERVER_ADDRESS];
        
        self.radiusExplanationLabel.text = @"PokeAlert will only look for Pokemon catchable from where you are. This is recommended if you can't walk to catch Pokemon, e.g. at home or at a restaurant.";
    }
    if (self.radiusSegmentedControl.selectedSegmentIndex == 2) {
        url = [NSString stringWithFormat:@"%@/forceradius/moving", SERVER_ADDRESS];
        
        self.radiusExplanationLabel.text = @"PokeAlert will look in your area for Pokemon. This is recommended if you can take a little detour to catch Pokemon or are on a walk.";
    }
    
    if (url != nil) {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"POST"];
        
        NSLog(@"sending url connection");
        [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
}

-(void)updateRarityExplanation {
    if (self.raritySegmentedControl.selectedSegmentIndex == 0) {
        self.rarityExplanationLabel.text = @"PokeAlert will notify you of all Pokemon nearby. This is recommended if you want to level up.";
    }
    if (self.raritySegmentedControl.selectedSegmentIndex == 1) {
        self.rarityExplanationLabel.text = @"PokeAlert will notify you of all Pokemon, except very common ones (e.g. Pidgey). This is recommended if you want to level up your Pokemon and catch new ones.";
    }
    if (self.raritySegmentedControl.selectedSegmentIndex == 2) {
        self.rarityExplanationLabel.text = @"PokeAlert will only alert you of rare Pokemon. This is recommended if you want to catch mostly new Pokemon.";
    }
    if (self.raritySegmentedControl.selectedSegmentIndex == 3) {
        self.rarityExplanationLabel.text = @"PokeAlert will not notify you of new Pokemon at all. This effectively pauses PokeAlert until you change this setting.";
    }
}

@end
