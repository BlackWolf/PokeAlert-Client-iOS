//
//  Misc.m
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import "Misc.h"

@implementation Misc

//Thanks http://www.movable-type.co.uk/scripts/latlong.html
+(double)distanceBetweenCoordinate:(CLLocationCoordinate2D)coord1 andCoordinate:(CLLocationCoordinate2D)coord2 {
    double R = 6371e3; // metres
    double φ1 = [Misc degToRad:coord1.latitude];
    double φ2 = [Misc degToRad:coord2.latitude];
    double Δφ = [Misc degToRad:(coord2.latitude-coord1.latitude)];
    double Δλ = [Misc degToRad:(coord2.longitude-coord1.longitude)];

    double a = sinf(Δφ/2) * sinf(Δφ/2) + cosf(φ1) * cosf(φ2) * sinf(Δλ/2) * sinf(Δλ/2);
    double c = 2 * atan2f(sqrtf(a), sqrtf(1-a));

    double d = R * c;
    
    return d;
}

+(double)degToRad:(double)deg {
    return deg * (M_PI/180);
}

//Thanks http://stackoverflow.com/questions/5084845/how-to-set-the-opacity-alpha-of-a-uiimage
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha toImage:(UIImage *)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeNormal alpha:alpha];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
