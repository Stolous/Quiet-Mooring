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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)sonnerie:(id)sender {
	
	self.sonnerieActive = !self.sonnerieActive;
}

- (IBAction)vibreur:(id)sender {
	
	self.vibreurActive = !self.vibreurActive;
}
@end
