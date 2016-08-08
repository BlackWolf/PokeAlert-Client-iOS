//
//  Misc.h
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Misc : NSObject

+(double)distanceBetweenCoordinate:(CLLocationCoordinate2D)coord1 andCoordinate:(CLLocationCoordinate2D)coord2;
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha toImage:(UIImage *)image;

@end
