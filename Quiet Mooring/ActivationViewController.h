//
//  ActivationViewController.h
//  Quiet Mooring
//
//  Created by Véré Baptiste on 19/12/2013.
//  Copyright (c) 2013 Magic Compagny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ActivationViewController;

@protocol ActivationViewControllerDelegate // Le protocole est implémenté par le MainViewController

@property (weak, nonatomic) id <ActivationViewControllerDelegate> delegate;
- (void)activationViewControllerDidFinish:(ActivationViewController *)controller;

@end


@interface ActivationViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
	
}


- (IBAction)annuler:(id)sender;
- (IBAction)valider:(id)sender;



@end
