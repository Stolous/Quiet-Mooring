//
//  activationSegue.m
//  Quiet Mooring
//
//  Created by Véré Baptiste on 20/12/2013.
//  Copyright (c) 2013 Magic Compagny. All rights reserved.
//

#import "activationSegue.h"

@implementation activationSegue

- (id)initWithIdentifier:(NSString *)identifier source:(MainViewController *)source destination:(UIViewController *)destination{
	
	
    UIStoryboard *storyBoard= [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	
	ActivationViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:@"ActivationView"];
	
    return [super initWithIdentifier:identifier source:source destination:viewController];
}

- (void)perform {
	
	if (nil == self.sourceViewController || nil == self.destinationViewController || [self.sourceViewController isActive]) return;
	UINavigationController *ctrl = [self.sourceViewController navigationController];
	[ctrl pushViewController:self.destinationViewController animated:YES];
}

@end
