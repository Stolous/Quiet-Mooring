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
	active = FALSE; // TODO récupérer le fait que le systeme était activé lors de la dernière fermeture.
	
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
	
	_sonnerieActive = controller.vibreurActive;
	_vibreurActive = controller.vibreurActive;
	
	NSLog(@"sonnerie: %@ vibreur: %@", _sonnerieActive ? @"Oui" : @"Non", _vibreurActive ? @"Oui" : @"Non");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (IBAction)appuiBoutonPrincipal:(id)sender {
	if (active == FALSE) {
		active = TRUE;
		[_boutonPrincipal setImage:[UIImage imageNamed:@"ON"] forState:UIControlStateNormal];
		NSLog(@"ON");
	}
	else if (active == TRUE) {
		active = FALSE;
		[_boutonPrincipal setImage:[UIImage imageNamed:@"OFF"] forState:UIControlStateNormal];
		NSLog(@"OFF");
	}
}
@end
