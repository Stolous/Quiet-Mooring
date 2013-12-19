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
	
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return /*[distances count]*/0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 44)];
	label.backgroundColor = [UIColor grayColor];
	label.textColor = [UIColor whiteColor];
	label.textAlignment = NSTextAlignmentCenter;
	label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
	//label.text = [distances objectAtIndex:row];
	return label;
}


- (IBAction)annuler:(id)sender {
	[self.delegate ActivationViewControllerDidFinish:self];
}

- (IBAction)valider:(id)sender {
}
@end
