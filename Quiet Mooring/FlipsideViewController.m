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
										  [NSNumber numberWithBool:NO], @"vibreurActive",
										  [NSNumber numberWithInt:6], @"distanceActivation", Nil];
	[[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsDefaults];
	
	[_switchSonnerie setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"sonnerieActive"] animated:NO];
	[_switchVibreur setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"vibreurActive"] animated:NO];
	
	distances = [[NSMutableArray alloc] init];
	[distances addObject:@"3"];
	[distances addObject:@"5"];
	[distances addObject:@"8"];
	[distances addObject:@"10"];
	[distances addObject:@"15"];
	[distances addObject:@"20"];
	[distances addObject:@"25"];
	[distances addObject:@"30"];
	[distances addObject:@"40"];
	[distances addObject:@"50"];
	[distances addObject:@"75"];
	[distances addObject:@"100"];
	[distances addObject:@"150"];
	[distances addObject:@"200"];
	
	[_distancePicker selectRow:[[NSUserDefaults standardUserDefaults] integerForKey:@"distanceActivation"] inComponent:0 animated:FALSE];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
	NSLog(@"sonnerie: %@ vibreur: %@", [[NSUserDefaults standardUserDefaults] boolForKey:@"sonnerieActive"] ? @"Oui" : @"Non",[[NSUserDefaults standardUserDefaults] boolForKey:@"vibreurActive"] ? @"Oui" : @"Non");
	
	[[NSUserDefaults standardUserDefaults] setInteger:[_distancePicker selectedRowInComponent:0] forKey:@"distanceActivation"];
	
	[[NSUserDefaults standardUserDefaults] synchronize];
	
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


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [distances count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
	label.backgroundColor = [UIColor grayColor];
	label.textColor = [UIColor whiteColor];
	label.textAlignment = NSTextAlignmentCenter;
	label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
	label.text = [distances objectAtIndex:row];
	return label;
}

@end
