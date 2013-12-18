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
	
	/*NSString *fileConfig = [[NSBundle mainBundle] pathForResource:@"Options" ofType:@"qmconfig"];
	NSData *data = [[NSData alloc]initWithContentsOfFile:fileConfig];
	NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	
	
	NSLog(@"%@", [string substringWithRange: NSMakeRange (0, 0)]);*/
	
//	NSMutableDictionary *dico = [[NSMutableDictionary alloc] init];
//	[dico setObject:TRUE forKey:@"sonnerieActive"];
	NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
	if ([userDefault boolForKey:@"sonnerieActive"]) {
		<#statements#>
	}
	[userDefault setBool:TRUE forKey:@"sonnerieActive"];
	[userDefault setBool:TRUE forKey:@"vibreurActive"];
	
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
	
	self.sonnerieActive = !(self.sonnerieActive);
	NSLog(@"%hhd", self.sonnerieActive);
}

- (IBAction)vibreur:(id)sender {
	
	self.vibreurActive = !(self.vibreurActive);
	NSLog(@"%hhd", self.vibreurActive);
}
@end
