//
//  SettingsViewController.h
//  PokeAlert
//
//  Created by Mario Schreiner on 26/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *radiusSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *raritySegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *radiusExplanationLabel;
@property (weak, nonatomic) IBOutlet UILabel *rarityExplanationLabel;

- (IBAction)radiusSegmentChanged:(id)sender;
- (IBAction)raritySegmentChanged:(id)sender;
- (IBAction)enableSwitchChanged:(id)sender;

@end
