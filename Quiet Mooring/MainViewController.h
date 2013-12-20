//
//  MainViewController.h
//  Quiet Mooring
//
//  Created by Véré Baptiste on 17/12/2013.
//  Copyright (c) 2013 Magic Compagny. All rights reserved.
//

#import "FlipsideViewController.h"
#import "ActivationViewController.h"

#import <CoreLocation/CoreLocation.h>

@interface MainViewController : UIViewController <ActivationViewControllerDelegate, FlipsideViewControllerDelegate, CLLocationManagerDelegate> {
	@public BOOL active;
	
	CLLocationManager *locationManager;

}

@property (weak, nonatomic) IBOutlet UIButton *boutonPrincipal;
- (IBAction)appuiBoutonPrincipal:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *texteInfo;


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;


@property (weak, nonatomic) IBOutlet UILabel *debugPos;
@property (weak, nonatomic) IBOutlet UILabel *debugCap;
@property (weak, nonatomic) IBOutlet UILabel *debugPrecision;



@end
