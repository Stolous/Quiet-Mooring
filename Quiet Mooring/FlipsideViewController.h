//
//  FlipsideViewController.h
//  Quiet Mooring
//
//  Created by Véré Baptiste on 17/12/2013.
//  Copyright (c) 2013 Magic Compagny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;


@property (weak, nonatomic) IBOutlet UIPickerView *distancePicker;

@property (weak, nonatomic) IBOutlet UISwitch *switchSonnerie;
@property (weak, nonatomic) IBOutlet UISwitch *switchVibreur;
- (IBAction)sonnerie:(id)sender;
- (IBAction)vibreur:(id)sender;


@end
