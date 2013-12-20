//
//  ActivationViewController.m
//  Quiet Mooring
//
//  Created by Véré Baptiste on 19/12/2013.
//  Copyright (c) 2013 Magic Compagny. All rights reserved.
//

#import "ActivationViewController.h"

@implementation ActivationViewController

- (void)viewDidLoad {
	
	longueursChaine = [[NSMutableArray alloc] initWithObjects:@"5", @"7,", @"10" , @"15", @"20", @"30", @"40", @"50", @"60", @"70", @"80", @"90", @"100", @"125",@"150", @"175", @"200", nil];
	profondeurs = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3" , @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14",@"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"23", @"25", @"26", @"27", @"28", @"29", @"30", nil];
	
	[_chainePicker selectRow:[[NSUserDefaults standardUserDefaults] integerForKey:@"longueurChaine"] inComponent:0 animated:FALSE];
	[_profondeurPicker selectRow:[[NSUserDefaults standardUserDefaults] integerForKey:@"profondeur"] inComponent:0 animated:FALSE];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	if (pickerView == _chainePicker) {
		return [longueursChaine count];
	}
	else if (pickerView == _profondeurPicker) {
		return [profondeurs count];
	}
	else {
		return 0;
	}
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
	label.backgroundColor = [UIColor grayColor];
	label.textColor = [UIColor whiteColor];
	label.textAlignment = NSTextAlignmentCenter;
	label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
	
	if (pickerView == _chainePicker) {
		label.text = [longueursChaine objectAtIndex:row];
	}
	else if (pickerView == _profondeurPicker) {
		label.text = [profondeurs objectAtIndex:row];
	}
	
	return label;
}


- (IBAction)annuler:(id)sender {
	[self.delegate activationViewControllerDidFinishCancel:self];
}

- (IBAction)valider:(id)sender {
	[[NSUserDefaults standardUserDefaults] setInteger:[_chainePicker selectedRowInComponent:0] forKey:@"longueurChaine"];
	[[NSUserDefaults standardUserDefaults] setInteger:[_profondeurPicker selectedRowInComponent:0] forKey:@"profondeur"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	[self.delegate activationViewControllerDidFinishStart:self];
}
@end
