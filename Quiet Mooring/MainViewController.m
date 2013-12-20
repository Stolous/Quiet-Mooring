//
//  MainViewController.m
//  Quiet Mooring
//
//  Created by Véré Baptiste on 17/12/2013.
//  Copyright (c) 2013 Magic Compagny. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background"]];
	
	NSDictionary *userDefaultsDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
										  [NSNumber numberWithBool:YES], @"sonnerieActive",
										  [NSNumber numberWithBool:NO], @"vibreurActive",
										  [NSNumber numberWithInt:6], @"distanceActivation",
										  [NSNumber numberWithInt:6], @"longueurChaine",
										  [NSNumber numberWithInt:6], @"profondeur", Nil];
	[[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsDefaults];
	
	active = FALSE; // TODO récupérer le fait que le systeme était activé lors de la dernière fermeture.
	
	
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"] || [[segue identifier] isEqualToString:@"showActivationView"]) {
        [[segue destinationViewController] setDelegate:self];
		
    }
}

- (IBAction)appuiBoutonPrincipal:(id)sender {
	if (active == FALSE) {
		[self performSegueWithIdentifier:@"showActivationView" sender:self];
		NSLog(@"ON");
	}
	else if (active == TRUE) {
		active = FALSE;
		[_boutonPrincipal setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
		NSLog(@"OFF");
	}
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Activation View

- (void)activationViewControllerDidFinishCancel:(ActivationViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)activationViewControllerDidFinishStart:(ActivationViewController *)controller
{
	active = TRUE;
	[_boutonPrincipal setImage:[UIImage imageNamed:@"ON"] forState:UIControlStateNormal];
	[self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)isActive {
	return active;
}

@end
