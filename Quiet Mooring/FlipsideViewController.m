//
//  FlipsideViewController.m
//  Quiet Mooring
//
//  Created by Véré Baptiste on 17/12/2013.
//  Copyright (c) 2013 Magic Compagny. All rights reserved.
//

#import "FlipsideViewController.h"

#import "MainViewController.h"


@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background"]];
	
	NSDictionary *userDefaultsDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
										  [NSNumber numberWithBool:YES], @"sonnerieActive",
										  [NSNumber numberWithBool:NO], @"vibreurActive", Nil];
	[[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsDefaults];
	
	[_switchSonnerie setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"sonnerieActive"] animated:NO];
	[_switchVibreur setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"vibreurActive"] animated:NO];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
	NSLog(@"sonnerie: %@ vibreur: %@", [[NSUserDefaults standardUserDefaults] boolForKey:@"sonnerieActive"] ? @"Oui" : @"Non",[[NSUserDefaults standardUserDefaults] boolForKey:@"vibreurActive"] ? @"Oui" : @"Non");
	
	
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)sonnerie:(id)sender {
	[[NSUserDefaults standardUserDefaults] setBool:_switchSonnerie.on forKey:@"sonnerieActive"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	NSLog(@"sonnerie: %hhd (switch: %hhd)", [[NSUserDefaults standardUserDefaults] boolForKey:@"sonnerieActive"], _switchSonnerie.on);
}

- (IBAction)vibreur:(id)sender {
	[[NSUserDefaults standardUserDefaults] setBool:_switchVibreur.on forKey:@"vibreurActive"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	NSLog(@"vibreur: %hhd (switch: %hhd)", [[NSUserDefaults standardUserDefaults] boolForKey:@"vibreurActive"], _switchVibreur.on);
}
@end
