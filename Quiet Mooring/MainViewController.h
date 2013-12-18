//
//  MainViewController.h
//  Quiet Mooring
//
//  Created by Véré Baptiste on 17/12/2013.
//  Copyright (c) 2013 Magic Compagny. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	
	BOOL active;
	
	int distanceActivation;
}

@property (weak, nonatomic) IBOutlet UIButton *boutonPrincipal;
- (IBAction)appuiBoutonPrincipal:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *texteInfo;

@property (nonatomic, assign) BOOL sonnerieActive;
@property (nonatomic, assign) BOOL vibreurActive;


@end
