//
//  CalendarAddViewController.m
//  CalendarAdd
//
//  Created by AgileThought on 11/27/12.
//  Copyright (c) 2012 AgileThought. All rights reserved.
//

#import "CalendarAddViewController.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface CalendarAddViewController ()

@end

@implementation CalendarAddViewController


-(void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action {
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Saved"
                                                    message:@"Your event has been saved!"
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    
    
    switch (action) {
		case EKEventEditViewActionCanceled:
			// Adding the event was cancelled.
			break;
			
		case EKEventEditViewActionSaved:
			// The event was saved
            [alert show];
			break;
			
		case EKEventEditViewActionDeleted:
			// The event was deleted
			break;
			
		default:
			break;
	}
    
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)addCalendarEntry:(id)sender

{EKEventStore * eventStore = [[EKEventStore alloc] init];
    
    EKEvent * event = [EKEvent eventWithEventStore:eventStore];
    event.calendar  = [eventStore defaultCalendarForNewEvents];
    event.title     = @"Take your Lipitor";
    event.location  = @"Home";
    event.notes     = @"Take once by mouth daily";
    
    EKEventEditViewController *controller = [[EKEventEditViewController alloc] init];
    
    controller.eventStore       = eventStore;
    controller.event            = event;
    controller.editViewDelegate = self;
    
    [self presentModalViewController:controller animated:YES];
    
    return;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
