//
//  MainViewController.h
//  Quiet Mooring
//
//  Created by Véré Baptiste on 17/12/2013.
//  Copyright (c) 2013 Magic Compagny. All rights reserved.
//

#import "FlipsideViewController.h"
#import "ActivationViewController.h"

@interface MainViewController : UIViewController <ActivationViewControllerDelegate, FlipsideViewControllerDelegate> { // implémente le delegate du FlipsideViwController
	@public BOOL active;

}

@property (weak, nonatomic) IBOutlet UIButton *boutonPrincipal;
- (IBAction)appuiBoutonPrincipal:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *texteInfo;

@end
