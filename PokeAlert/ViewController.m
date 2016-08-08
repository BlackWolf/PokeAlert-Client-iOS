//
//  ViewController.m
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "Config.h"
#import "Misc.h"

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (readwrite, retain) CLLocationManager *locationManager;
@property (readwrite) CLLocationCoordinate2D lastCoordinate;
@property (readwrite, retain) NSDate *lastSignificantLocationUpdate;
@property (readwrite, retain) NSTimer *checkPauseLocationUpdatesTimer;
@property (readwrite) BOOL areLocationUpdatesPaused;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.areLocationUpdatesPaused = NO;
    self.lastSignificantLocationUpdate = [NSDate date];
//    self.checkPauseLocationUpdatesTimer = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(checkPauseLocationUpdates) userInfo:nil repeats:YES];
    
    //Initiate location services
    self.locationManager = [[CLLocationManager alloc] init];
    
    [self.locationManager requestAlwaysAuthorization];
    
    self.locationManager.delegate = self;
//    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
//    self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    self.locationManager.allowsBackgroundLocationUpdates = YES;
//    self.locationManager.activityType = CLActivityTypeFitness;
    self.locationManager.pausesLocationUpdatesAutomatically = NO;
    
    //set the number of meters of movement after which a location update is fired
    //since the server gives us all pokemon in a large radius (~500m) for every location, we don't
    //need this to fire too often´
    self.locationManager.distanceFilter = 100;
    
    [self.locationManager startUpdatingLocation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.map.userTrackingMode != MKUserTrackingModeFollowWithHeading) {
            [self.map setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
        }
    });
}

-(void)checkPauseLocationUpdates {
    if (self.areLocationUpdatesPaused) return;
    if ([[UIApplication sharedApplication] applicationState] != UIApplicationStateBackground) return;
    
    //If the last significant location change occured over 10 minutes ago, we pause GPS
    double sinceLastLocationUpdate = fabs([self.lastSignificantLocationUpdate timeIntervalSinceNow])/60;
    if (sinceLastLocationUpdate >= 1) {
        int waitUntilResume = 1;
        if (sinceLastLocationUpdate >= 30)  waitUntilResume = 2;
        if (sinceLastLocationUpdate >= 90)  waitUntilResume = 5;
        if (sinceLastLocationUpdate >= 180) waitUntilResume = 10;
        
        NSLog(@"stopping location updates");
        [self.locationManager stopUpdatingLocation];
        
        self.areLocationUpdatesPaused = YES;
        
//        [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//            [self tryResumeLocationUpdates];
//        }];
        
        [NSTimer scheduledTimerWithTimeInterval:waitUntilResume*60.0 target:self selector:@selector(tryResumeLocationUpdates) userInfo:nil repeats:NO];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(waitUntilResume*60.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"restarting location updates");
//            [self.locationManager startUpdatingLocation];
//            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                //call this method again
//                //if the user still did not move, calling this method again will pause location updates again
//                self.areLocationUpdatesPaused = NO;
//                [self checkPauseLocationUpdates];
//            });
//        });
    }
}

-(void)tryResumeLocationUpdates {
    NSLog(@"restarting location updates");
    [self.locationManager startUpdatingLocation];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(tryResumeLocationUpdates2) userInfo:nil repeats:NO];
}

-(void)tryResumeLocationUpdates2 {
    NSLog(@"restarting location updates 2");
    //call this method again
    //if the user still did not move, calling this method again will pause location updates again
    self.areLocationUpdatesPaused = NO;
    [self checkPauseLocationUpdates];
}

- (IBAction)gpsButtonPressed:(id)sender {
    if (self.map.userTrackingMode != MKUserTrackingModeFollowWithHeading) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.map setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
        });
    }
}

-(void)addPokemonToMap:(NSDictionary *)pokemonInfo {
    [self.map addPokemon:pokemonInfo];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
//    NSDate* eventDate = location.timestamp;
//    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
//    if (fabs(howRecent) < 15.0) {
    if (location.horizontalAccuracy < 100 &&
        (CLLocationCoordinate2DIsValid(self.lastCoordinate) == NO || [Misc distanceBetweenCoordinate:location.coordinate andCoordinate:self.lastCoordinate] > 100)) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f (%.2f)\n",
              location.coordinate.latitude,
              location.coordinate.longitude,
              location.horizontalAccuracy);
        
        //We got a new location update - send it to the server that will monitor nearby pokemon
        NSString *url = [NSString stringWithFormat:@"%@/setlocation/%f/%f", SERVER_ADDRESS, location.coordinate.latitude,location.coordinate.longitude];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"POST"];
        [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        self.lastCoordinate = location.coordinate;
        self.lastSignificantLocationUpdate = [NSDate date];
    }
}

-(void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager {
    NSLog(@"paused location updates");
}

-(void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager {
    NSLog(@"resumed location updates");
}

- (IBAction)settingsCloseButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
